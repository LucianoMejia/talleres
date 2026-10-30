# Talleres de matemáticas

Sitio académico construido con [Quarto](https://quarto.org/). Los talleres nuevos se escriben en Markdown (`.qmd`) y las fórmulas se escriben con LaTeX.

## Ver el sitio localmente

Instala Quarto y ejecuta:

```bash
quarto preview
```

Para generar el sitio final:

```bash
quarto render
```

El resultado queda en `_site/`.

## Publicar en GitHub Pages

El workflow de `.github/workflows/publish.yml` publica automáticamente cada vez que se hace push a `main`.

En GitHub, entra a **Settings > Pages** y selecciona **GitHub Actions** como fuente de publicación.

## Agregar un taller

1. Crea `talleres/nombre-de-materia/taller6.qmd`.
2. Crea la respuesta en `respuestas/nombre-de-materia/taller6.qmd`.
3. Agrega ambos enlaces en la página correspondiente dentro de `materias/`.
4. Revisa con `quarto preview` y haz push a `main`.
