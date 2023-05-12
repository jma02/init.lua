local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local r = require("luasnip.extras").rep

ls.add_snippets(cpp, {
  cpp = {
        s({
            trig = "for",
            namr = "For loop (competitive programming)",
            dscr = "Iterates over n",
        }, {
            t({"for(int i = 0; i < n; i++){", 
            "\t"}),
            i(1),
            t({"",
            "}"})
        }),
        s({
            trig = "vi",
            namr = "vector<int>",
            dscr = "vector<int>",
        }, {
            t("vector<int> "),
            i(1)
        }),
    }, 
})
