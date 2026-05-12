function Div(el)
  if el.classes:includes("Theorie") then
    return {
      pandoc.RawBlock("latex", "\\begin{theorybox}"),
      el,
      pandoc.RawBlock("latex", "\\end{theorybox}")
    }
  end
end
