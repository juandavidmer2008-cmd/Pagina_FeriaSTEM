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
- El formulario valida los datos y muestra el mensaje de **"¡Registro confirmado!"**, pero **no guarda en ningún lado**.
- Sirve solo para probar cómo se ve y se siente. ⚠️ Para recibir inscripciones de verdad, activa el modo SQL.
- La página es pública: el usuario final **nunca** puede ver ni descargar los registros. Esos solo los ves tú desde el panel de Supabase.

### 🟢 Modo SQL real (recomendado — base de datos en la nube, gratis)
Los registros se guardan en una base de datos **PostgreSQL** con Supabase. Todos en un solo lugar, visibles solo para ti y exportables a Excel. Ideal porque sirve para este año y los siguientes.

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

## 3. Dónde pegar tus imágenes y textos (listas editables)

Abre `index.html` con el Bloc de notas y busca el bloque **"⬇️ CONTENIDO EDITABLE"** (cerca del final). Ahí cambias **solo esas listas** y el resto se arma solo:

| Lista | Qué controla | Cómo se usa |
|---|---|---|
| `fotosFeria` | **Carrusel de 6 fotos** de la primera edición (sección "Qué es la feria") | Pega la dirección de cada foto entre comillas: `"fotos/foto1.jpg"` o `"https://..."`. Si la dejas vacía `""` se ve un espacio reservado. |
| `ponentesSTEM` | Los **4 ponentes** del ciclo STEM (botón "Ver charlas") | Por cada letra completa `nombre`, `tema` y pega la `foto`. |
| `logosParticipantes` | **Carrusel de logos de participantes** (universidades, clubes, startups) | Pega la dirección de cada logo. Al hacer clic se ven ampliados (zoom). |
| `logosAliados` | **Carrusel de logos de aliados** | Pega la dirección de cada logo. También con zoom al hacer clic. |
| `logoInstituciones` | **Logo institucional** del navbar, arriba a la derecha (CBA Santa Cruz + American Spaces, ya combinados) | Ya apunta a `logocba.png`. Cámbialo si quieres otra versión. |

> El **logo de la Feria** (arriba a la izquierda) es la imagen `logoferiaazul.png`, puesta directamente en el `<img>` del navbar. Para cambiarlo, reemplaza ese archivo o edita el `src`. Los archivos de logo (`logocba.png`, `logoferiaazul.png`, etc.) deben estar en esta misma carpeta.

> Truco para imágenes locales: crea una carpeta `fotos` dentro de `feria-stem`, pon ahí las imágenes y escribe la ruta, p.ej. `"fotos/cba.png"`.

## 4. Qué falta por confirmar

- **Logos reales** de CBA y American Spaces (ahora hay un recuadro "CBA" de texto).
- **Nombres y fotos de los ponentes** de las 4 charlas STEM.
- **Fotos** de la primera edición y **logos** de aliados (ver tabla de arriba).
- Verifica los **enlaces de redes sociales** del footer (los armé a partir de los @usuarios del flyer).

---

## 5. Nota sobre la fecha

El flyer dice **"Miércoles 30/06"**, pero el 30 de junio de 2026 cae **martes**.
Revisa cuál es el dato correcto y, si hace falta, dime para ajustarlo en la página (aparece en el hero, el cronograma y la ubicación).

---

## Archivos

| Archivo | Para qué sirve |
|---|---|
| `index.html` | La página completa (diseño + formulario). |
| `schema.sql` | El código para crear la tabla en Supabase. |
| `LEEME.md` | Este archivo. |
