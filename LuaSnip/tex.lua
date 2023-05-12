local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local r = require("luasnip.extras").rep

ls.add_snippets(tex, {
  tex = {
        s({
            trig = "b",
            namr = "\textbf{}",
            dscr = "bold font",
        }, {
            t("\\textbf{"),
            i(1),
            t("}")
        }),
        s({
            trig = "alph",
            namr = "alph",
            dscr = "alphabetically enumerate items",
        }, {
            t({"\\begin{enumerate}[label=(\\alph*).])", "\t"}),
            i(1),
            t({"","\\end{enumerate}"})
        }),
    }, 
})
