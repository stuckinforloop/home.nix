return {
    {
        "vague2k/vague.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("vague").setup({
                transparent = false,
                style = {
                    boolean = "bold",
                    number = "none",
                    float = "none",
                    error = "bold",
                    comments = "none",
                    conditionals = "none",
                    functions = "none",
                    headings = "bold",
                    operators = "bold",
                    strings = "none",
                    variables = "none",

                    -- keywords
                    keywords = "bold",
                    keyword_return = "none",
                    keywords_loop = "none",
                    keywords_label = "none",
                    keywords_exception = "none",

                    -- builtin
                    builtin_constants = "bold",
                    builtin_functions = "none",
                    builtin_types = "bold",
                    builtin_variables = "none",
                },

                plugins = {
                    lsp = {
                        diagnostic_error = "bold",
                        diagnostic_hint = "none",
                        diagnostic_info = "italic",
                        diagnostic_ok = "none",
                        diagnostic_warn = "bold",
                    },
                },
            })

            -- vim.cmd("colorscheme vague")
        end,
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                contrast = "hard",
                terminal_colors = true,
                transparent_mode = true,
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = false,
                    operators = false,
                    folds = false,
                },
                palette_overrides = {
                    bg = "#181a1b",
                    fg = "#fbf1c7",
                    dark0 = "#181a1b",
                    dark1 = "#282828",
                    dark2 = "#32302f",
                    dark3 = "#3c3836",
                    dark4 = "#504945",
                    light0 = "#fbf1c7",
                    light1 = "#ebdbb2",
                    light2 = "#d5c4a1",
                    light3 = "#bdae93",
                    light4 = "#a89984",
                    bright_red = "#fb4934",
                    bright_green = "#b8bb26",
                    bright_yellow = "#fabd2f",
                    bright_blue = "#83a598",
                    bright_purple = "#d3869b",
                    bright_aqua = "#8ec07c",
                    bright_orange = "#fe8019",
                    neutral_red = "#cc241d",
                    neutral_green = "#98971a",
                    neutral_yellow = "#d79921",
                    neutral_blue = "#458588",
                    neutral_purple = "#b16286",
                    neutral_aqua = "#689d6a",
                    neutral_orange = "#d65d0e",
                    faded_red = "#9d0006",
                    faded_green = "#79740e",
                    faded_yellow = "#b57614",
                    faded_blue = "#076678",
                    faded_purple = "#8f3f71",
                    faded_aqua = "#427b58",
                    faded_orange = "#af3a03",
                },
                overrides = {
                    Pmenu = { link = "Normal" },
                },
            })

            vim.cmd("colorscheme gruvbox")
        end,
    },
}
