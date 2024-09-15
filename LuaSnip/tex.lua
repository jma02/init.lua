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
        parse_snippet({ trig = "beg", name = "begin{} / end{}" }, "\\begin{$1}\n\t$0\n\\end{$1}"),
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
