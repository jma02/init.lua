local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local r = require("luasnip.extras").rep
          
local parse_snippet = ls.extend_decorator.apply(ls.parser.parse_snippet, {
    condition = condition,
  }) --[[@as function]]
ls.add_snippets(tex, {
  tex = {
        s(
          { trig = "align", name = "Align" },
          { t({ "\\begin{align*}", "\t" }), i(1), t({ "", "\\end{align*}" }) }
          ),
        s(
          { trig = "proof", name = "Proof" },
          { t({ "\\begin{proof}", "\t" }), i(1), t({ "", "\\end{proof}" }) }
          ),
        s(
          { trig = "enumerate", name = "Enumerate" },
          { t({ "\\begin{enumerate}", "\t" }), i(1), t({ "", "\\end{enumerate}" }) }
          ),
        s(
          { trig = "theorem", name = "Theorem" },
          { t({ "\\begin{theorem}", "\t" }), i(1), t({ "", "\\end{theorem}" }) }
          ),
        s(
          { trig = "lemma", name = "Lemma" },
          { t({ "\\begin{lemma}", "\t" }), i(1), t({ "", "\\end{lemma}" }) }
          ),
        s(
          { trig = "proposition", name = "Proposition" },
          { t({ "\\begin{proposition}", "\t" }), i(1), t({ "", "\\end{proposition}" }) }
          ),
        s(
          { trig = "corollary", name = "Corollary" },
          { t({ "\\begin{corollary}", "\t" }), i(1), t({ "", "\\end{corollary}" }) }
          ),
        s(
          { trig = "definition", name = "Definition" },
          { t({ "\\begin{definition}", "\t" }), i(1), t({ "", "\\end{definition}" }) }
          ),
        s(
          { trig = "example", name = "Example" },
          { t({ "\\begin{example}", "\t" }), i(1), t({ "", "\\end{example}" }) }
          ),
        s(
          { trig = "exercise", name = "Exercise" },
          { t({ "\\begin{exercise}", "\t" }), i(1), t({ "", "\\end{exercise}" }) }
          ),
        s(
          { trig = "equation", name = "Equation" },
          { t({ "\\begin{equation*}", "\t" }), i(1), t({ "", "\\end{equation*}" }) }
          ),
        s(
          { trig = "figure", name = "Figure" },
          {
            t({"\\begin{figure}",
            "\t\\centering",
            "\t\\includegraphics[width=0.5\\linewidth]{"}),
            i(1), 
            t({"}",
            "\t\\caption{}",
            "\t\\label{}",
            "\\end{figure}"
          })}
          ),
        s(
          { trig = "cases", name = "Piecewise Equation" },
          { 
            t({ "\\begin{cases}", "\t" }), 
            i(1), 
            t(" & "), 
            i(2), 
            t({ "\\\\", "\\end{cases}" }) 
          }
        ),
        s(
          { trig = "biggBrack", name = "Bigg Brackets" },
          {
            t("\\bigg["),
            i(1),
            t("\\bigg]")
            }
          ),
        s(
          { trig = "biggP", name = "Bigg Parentheses" },
          {
            t("\\bigg("),
            i(1),
            t("\\bigg)")
            }
          ),


        parse_snippet({ trig = "lim", name = "limit" }, "\\lim_{${1:n} \\to ${2:\\infty}} "),
        parse_snippet(
              { trig = "prod", name = "product" },
              "\\prod_{${1:n=${2:1}}}^{${3:\\infty}} ${4:${TM_SELECTED_TEXT}} $0"
            ),
        parse_snippet({ trig = "sum", name = "sum" }, "\\sum_{n=${1:1}}^{${2:\\infty}} ${3:a_n z^n}"),
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
