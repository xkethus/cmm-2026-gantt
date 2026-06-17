# CMM 2026 · Gantt interactivo y saturación

App web del programa 2026 del Centro Multimedia: diagrama de Gantt por área y mapa
de calor de saturación diaria (actividades simultáneas), con filtros, y modo edición
para crear/editar/borrar actividades.

## Arquitectura

- **Vista (frontend):** `index.html`, un solo archivo. Se despliega como sitio estático
  (Vercel). Cualquiera con el enlace puede ver el Gantt.
- **Datos (backend):** Supabase (proyecto `cmm-programa-2026`). Tabla `actividades`.
  - Lectura: pública (cualquiera puede ver).
  - Escritura: solo el correo dueño (xkethus@gmail.com), protegida por RLS.

La llave que aparece en `index.html` es la *publishable key* de Supabase: es segura de
exponer públicamente. La seguridad real está en las políticas RLS de la base, no en
ocultar la llave.

## Modo edición

1. Pulsa "Editar (entrar)" arriba a la derecha e ingresa el correo dueño.
2. Llega un enlace al correo; ábrelo en el mismo navegador.
3. Ya autenticado aparecen: botón "+ Nueva actividad", lápiz (✎) para editar y "−" para
   quitar actividades del cálculo. Las quitadas quedan abajo con un "+" para regresarlas.

### Requisito de configuración (una sola vez)
Para que el enlace mágico funcione en producción, agrega la URL de tu sitio de Vercel en:
Supabase -> Authentication -> URL Configuration -> Site URL (y Redirect URLs).

## Despliegue en Vercel

Sitio estático, sin configuración: Vercel detecta `index.html` en la raíz y lo publica.
Para actualizar, reemplaza `index.html` en el repo y Vercel redesplega solo.
