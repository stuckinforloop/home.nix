return {
    "saghen/blink.cmp",
    version = "1.*",
    config = function()
        require("blink.cmp").setup({
            keymap = {
                preset = "enter",
                ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
                ["<C-e>"] = { "hide", "fallback" },
                ["<CR>"] = { "accept", "fallback" },

                ["<Tab>"] = { "select_next", "fallback" },
                ["<S-Tab>"] = { "select_prev", "fallback" },

                ["<C-b>"] = { "scroll_documentation_up", "fallback" },
                ["<C-f>"] = { "scroll_documentation_down", "fallback" },

                ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
            },
            completion = {
                documentation = {
                    auto_show = true,
                    -- treesitter_highlighting = true,
                },
                keyword = {
                    range = "prefix",
                },
                list = {
                    selection = {
                        preselect = true,
                        auto_insert = false,
                    },
                },
                accept = {
                    dot_repeat = false,
                    create_undo_point = true,
                    auto_brackets = {
                        enabled = false,
                    },
                },
                menu = {
                    draw = {
                        columns = { { "label", "label_detail", gap = 1 }, { "kind" } },
                        components = {
                            label = {
                                width = { max = 30, fill = true },
                                text = function(ctx)
                                    return ctx.label
                                end,
                            },
                            label_detail = {
                                width = { fill = true, max = 15 },
                                text = function(ctx)
                                    return ctx.label_detail
                                end,
                            },
                            source_name = {},
                        },
                    },
                },
            },
            appearance = {
                nerd_font_variant = "mono",
            },

            sources = {
                default = { "lsp", "path", "buffer" },
                providers = {
                    buffer = {
                        enabled = true,
                    },
                    snippets = {
                        enabled = false,
                    },
                },
            },
            fuzzy = {
                -- implementation = "rust",
                frecency = {
                    enabled = true,
                },
                use_proximity = true,
                max_typos = function(_)
                    return 0
                end,
                prebuilt_binaries = {
                    download = true,
                    ignore_version_mismatch = true,
                },
            },
        })
    end,
}
