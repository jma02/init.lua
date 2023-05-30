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
        s({
            trig = "prime",
            namr = "prime",
            dscr = "append a single prime",
        }, {
            t("^{\\prime}"),
        }),
        s({
            trig = "beg",
            namr = "begin, end",
            dscr = "create a begin end environment",
        }, {
            t("\\begin{"),
            i(1),
            t({"}", "\t"}),
            t({"", "\\end{"}),
            i(2),
            t("}"),
        }),
        s({
            trig = "disp",
            namr = "display math",
            dscr = "create a display math environment",
        }, {
            t({"\\[", "\t"}),
            i(1),
            t({"", "\\]"})
        }),
        s({
            trig = "i",
            namr = "italicize",
            dscr = "italicize",
        }, {
            t("\\textit{"),
            i(1),
            t("}")
        }),
    }, 
})
