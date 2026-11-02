# Talleres

Sitio web con talleres, solucionarios y explicaciones para practicar, construido con [Quarto](https://quarto.org/). Las páginas se escriben en Markdown (`.qmd`) y las fórmulas en LaTeX.

## Organización

El sitio se organiza por áreas y, dentro de cada área, por materias en el orden en que se estudian. Por ahora hay un área, Matemáticas:

1. Matemáticas básicas
2. Cálculo diferencial
3. Cálculo integral
4. Álgebra lineal
5. Ecuaciones diferenciales

```
_quarto.yml                  configuración y menú lateral (orden de las materias)
index.qmd                    página de inicio
solucionarios.qmd            lista de todos los solucionarios
materias/<materia>.qmd       página de cada materia con la tabla de talleres
talleres/<materia>/tallerN.qmd     enunciados
respuestas/<materia>/tallerN.qmd   solucionarios
explicaciones/               material de apoyo
styles.css                   estilos generales (estilo Apple)
theme-light.scss             tema claro (sobre cosmo): letra, colores y bordes
theme-dark.scss              tema oscuro (sobre darkly)
taller-switch.lua            pestañas Enunciado / Solucionario en cada taller
```

## Ver el sitio localmente

Instale Quarto y ejecute:

```bash
quarto preview
```

Para generar el sitio final (queda en `_site/`):

```bash
quarto render
```

## Publicar en GitHub Pages

El workflow `.github/workflows/publish.yml` publica el sitio cada vez que se hace push a `main`. En GitHub, entre a **Settings > Pages** y seleccione **GitHub Actions** como fuente.

## Agregar un taller

1. Cree `talleres/<materia>/tallerN.qmd` y `respuestas/<materia>/tallerN.qmd` copiando la estructura de uno existente (encabezado con `title`, `subtitle` y `categories`, sección `## Instrucciones`, puntos `## Punto 1. ...` y el bloque `.taller-nav` al final).
2. Agregue la fila del taller en `materias/<materia>.qmd`.
3. Agregue el taller y su solucionario en el menú lateral de `_quarto.yml` y en `solucionarios.qmd`.
4. Revise con `quarto preview` y haga push a `main`.

## Agregar otra área

1. Cree la página de cada materia en `materias/` y sus talleres en `talleres/<materia>/` y `respuestas/<materia>/`, igual que en Matemáticas.
2. En `_quarto.yml`, agregue una nueva `section` al mismo nivel que `"Matemáticas"`, con sus materias adentro.
3. En `index.qmd`, agregue un título `## <Área>` con sus tarjetas `.materia`, copiando las de Matemáticas.
4. En `solucionarios.qmd`, agregue `## <Área>` y una tabla por materia.

### Convenciones

- Los ejercicios de cada punto se escriben como lista numerada (`1.`); el sitio los muestra como a), b), c)…
- Los subítems se indentan con cuatro espacios y se muestran como i, ii, iii…
- Fórmula en línea: `$x^2$`. Fórmula centrada: `$$ ... $$` en líneas propias.
- Un recuadro de ayuda se escribe así:

  ```markdown
  ::: {.callout-tip}
  Texto del recuadro.
  :::
  ```
