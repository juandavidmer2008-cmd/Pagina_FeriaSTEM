-- =====================================================================
--  Feria STEM 2026 — Tabla de registros (PostgreSQL / Supabase)
--  Copia y pega TODO esto en Supabase → SQL Editor → Run
-- =====================================================================

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
  creado_en   timestamptz default now()
);

-- Seguridad: activamos Row Level Security.
alter table registros enable row level security;

-- Permitimos que el formulario público (clave "anon") SOLO pueda INSERTAR.
-- Nadie podrá leer los datos desde la web: tú los ves en el panel de Supabase.
drop policy if exists "Permitir registro publico" on registros;
create policy "Permitir registro publico"
  on registros
  for insert
  to anon
  with check (true);
