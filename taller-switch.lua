-- Agrega al inicio de cada taller y de cada solucionario un selector
-- "Enunciado / Solucionario" para pasar de uno al otro con un clic.

local function pestana(texto, icono, href, activa)
  if activa then
    return '<span class="activa" aria-current="page"><i class="bi bi-' .. icono .. '"></i> ' .. texto .. '</span>'
  end
  return '<a href="' .. href .. '"><i class="bi bi-' .. icono .. '"></i> ' .. texto .. '</a>'
end

function Pandoc(doc)
  local archivo = quarto.doc.input_file:gsub("\\", "/")
  local tipo, materia, n = archivo:match("/(%a+)/([%w-]+)/taller(%d+)%.qmd$")
  if (tipo ~= "talleres" and tipo ~= "respuestas") or not materia then
    return doc
  end

  local nombre = "taller" .. n .. ".html"
  local html = '<nav class="taller-switch" aria-label="Enunciado o solucionario">'
    .. pestana("Enunciado", "journal-text", "../../talleres/" .. materia .. "/" .. nombre, tipo == "talleres")
    .. pestana("Solucionario", "check2-circle", "../../respuestas/" .. materia .. "/" .. nombre, tipo == "respuestas")
    .. '</nav>'

  table.insert(doc.blocks, 1, pandoc.RawBlock("html", html))
  return doc
end
