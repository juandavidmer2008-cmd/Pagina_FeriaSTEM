# Feria STEM 2026 — Página web

Página oficial del evento (CBA Santa Cruz × American Spaces).
Hecha en **HTML + Tailwind CSS** en un solo archivo: `index.html`.

---

## 1. Cómo ver la página

Doble clic en **`index.html`** y se abre en tu navegador. No necesitas instalar nada.

> Para publicarla en internet gratis: sube esta carpeta a **Netlify** (arrastrar y soltar en https://app.netlify.com/drop), **Vercel** o **GitHub Pages**.

---

## 2. El registro de asistentes (Google Sheets)

Los registros se guardan en un **Google Sheet** (tu "Excel" en la nube) mediante un **Google Apps Script** ya configurado. El flujo completo es:

1. La persona se **registra** en la página → sus datos van a tu Google Sheet (hoja "Registros").
2. Recibe en pantalla un **código QR** (formato `STEM26-…`) y puede añadir el evento a su calendario.
3. El día del evento, tú abres **`admin_asistencia.html`** y **escaneas su QR** (con la cámara) o escribes el **código manual** → se marca su **asistencia** en el mismo Google Sheet.

### Configuración (ya hecha)
La conexión está en la variable `GOOGLE_SCRIPT_URL` del `index.html` (y del `admin_asistencia.html`). Apunta a tu Apps Script publicado como *Aplicación web*. Si algún día cambias de hoja/script, actualiza esa URL en **ambos** archivos.

> Nota: el formulario envía **todos** los campos (incluye edad, género y educación). Si tu Google Sheet no muestra esas columnas, hay que añadirlas en el Apps Script. Si quieres, me pasas el código del Apps Script y lo reviso.

### El validador de asistencia — `admin_asistencia.html`
- Es **solo para los organizadores** (tiene un login demo: usuario `admin`, contraseña `1234`).
- Permite **escanear el QR con la cámara** o validar por **código manual**.
- Marca la asistencia en el Google Sheet y avisa si un QR **ya fue usado**.
- ⚠️ La cámara solo funciona si la página está **publicada en internet (https)** o se abre en `localhost`. Abierta con doble clic (file://) la cámara no enciende, pero el **código manual sí** funciona.

### 🧪 Registro de Talleres (Google Forms)
El registro de **talleres** es aparte y abre un Google Forms. Pega la URL de tu formulario en la variable `GOOGLE_FORM_TALLERES` del `index.html` (bloque "⬇️ CONTENIDO EDITABLE"). Mientras esté vacía, el botón avisa que estará disponible pronto.

### 📧 Correo automático (pendiente)
El envío automático de correo necesita un servicio externo (EmailJS o una función de Supabase). Por ahora el QR y el calendario se muestran en pantalla. Cuando quieras, lo añadimos.

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
