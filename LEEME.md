# Feria STEM 2026 — Página web

Página oficial del evento (CBA Santa Cruz × American Spaces).
Hecha en **HTML + Tailwind CSS** en un solo archivo: `index.html`.

---

## 1. Cómo ver la página

Doble clic en **`index.html`** y se abre en tu navegador. No necesitas instalar nada.

> Para publicarla en internet gratis: sube esta carpeta a **Netlify** (arrastrar y soltar en https://app.netlify.com/drop), **Vercel** o **GitHub Pages**.

---

## 2. El registro de asistentes

El formulario tiene **dos modos**:

### 🟡 Modo demo (activo por defecto, sin configurar nada)
- Los registros se guardan en el **navegador** de cada persona.
- Aparece un botón para **descargar los registros en CSV** (se abre con Excel).
- Sirve para probar. ⚠️ No usar así el día del evento, porque cada registro queda solo en el dispositivo de quien lo llenó.

### 🟢 Modo SQL real (recomendado — base de datos en la nube, gratis)
Los registros se guardan en una base de datos **PostgreSQL** con Supabase. Todos en un solo lugar, visibles para ti y exportables a Excel. Ideal porque sirve para este año y los siguientes.

**Pasos (10 minutos, una sola vez):**

1. Entra a **https://supabase.com** → crea una cuenta gratis → **New project**.
   (Guarda la contraseña de la base de datos que te pida.)
2. Cuando el proyecto esté listo, ve a **SQL Editor** (icono `</>` en el menú izquierdo) → **New query**.
3. Abre el archivo **`schema.sql`** de esta carpeta, copia todo su contenido, pégalo y pulsa **Run**.
   Esto crea la tabla `registros`.
4. Ve a **Project Settings** (engranaje) → **API**. Copia:
   - **Project URL** (algo como `https://xxxxx.supabase.co`)
   - **anon public** key (una clave larga)
5. Abre **`index.html`** con el Bloc de notas, busca cerca del final estas líneas y pega tus valores:

   ```js
   const SUPABASE_URL = "";       // ← pega aquí tu Project URL
   const SUPABASE_ANON_KEY = "";  // ← pega aquí tu clave anon public
   ```

6. Guarda. ¡Listo! Ahora cada registro se guarda en la nube.

**¿Dónde veo los inscritos?**
En Supabase → **Table Editor** → tabla `registros`. Puedes exportar a CSV con el botón **Export**.

---

## 3. Qué falta por personalizar (placeholders)

- **Logos reales** de CBA y American Spaces (ahora hay un recuadro "CBA" de texto).
- **Logos de aliados** (universidades, clubes, startups) en la sección "Participantes".
- Confirmar **horarios exactos** del cronograma (puse horas de referencia).
- Verifica los **enlaces de redes sociales** del footer (los armé a partir de los @usuarios del flyer).

---

## 4. Nota sobre la fecha

El flyer dice **"Miércoles 30/06"**, pero el 30 de junio de 2026 cae **martes**.
Revisa cuál es el dato correcto y, si hace falta, dime para ajustarlo en la página (aparece en el hero, el cronograma y la ubicación).

---

## Archivos

| Archivo | Para qué sirve |
|---|---|
| `index.html` | La página completa (diseño + formulario). |
| `schema.sql` | El código para crear la tabla en Supabase. |
| `LEEME.md` | Este archivo. |
