-- =====================================================================
--  Feria STEM 2026 — Base de datos del registro de la FERIA (Supabase)
--  Copia y pega TODO esto en Supabase → SQL Editor → Run
--  (puedes volver a ejecutarlo cuando quieras; es seguro)
-- =====================================================================

-- 1) Tabla de registros
create table if not exists registros (
  id          bigint generated always as identity primary key,
  nombre      text not null,
  email       text not null,
  telefono    text not null,
  edad        integer,
  genero      text,
  educacion   text,
  tipo        text,
  institucion text,
  actividades text[],
  codigo      text,                       -- código único para el QR
  asistio     boolean default false,      -- se marca true al escanear el QR
  creado_en   timestamptz default now()
);

-- Por si la tabla ya existía sin las columnas nuevas:
alter table registros add column if not exists codigo  text;
alter table registros add column if not exists asistio boolean default false;

-- Cada código debe ser único
create unique index if not exists registros_codigo_idx on registros (codigo);

-- 2) Seguridad (RLS): activar y permitir SOLO insertar al público
alter table registros enable row level security;

drop policy if exists "Permitir registro publico" on registros;
create policy "Permitir registro publico"
  on registros for insert to anon with check (true);

-- 3) Confirmar asistencia de forma segura (sin exponer la tabla completa).
--    La página confirmar.html llama a esta función con el código del QR;
--    marca asistio = true y devuelve el nombre. No permite leer otros datos.
create or replace function confirmar_asistencia(p_codigo text)
returns table (nombre text, ya_estaba boolean)
language plpgsql
security definer
set search_path = public
as $$
declare
  v_nombre text;
  v_asistio boolean;
begin
  select r.nombre, r.asistio into v_nombre, v_asistio
  from registros r where r.codigo = p_codigo;

  if v_nombre is null then
    return;  -- código no encontrado: no devuelve filas
  end if;

  if not v_asistio then
    update registros set asistio = true where codigo = p_codigo;
  end if;

  return query select v_nombre, v_asistio;
end;
$$;

grant execute on function confirmar_asistencia(text) to anon;
