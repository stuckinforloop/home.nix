local M = {}

function M.setup()
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- git
    keymap("n", "<leader>s", ":G<CR>", opts)
    keymap("n", "<leader>h", ":Git push<CR>", opts)
    keymap("n", "<leader>c", ":Git commit<CR>", opts)
    keymap("n", "<leader>v", ":Gvdiffsplit<CR>", opts)

    -- picker
    keymap("n", "<leader>f", ":Pick files<CR>", opts)
    keymap("n", "<leader>g", ":Pick grep_live<CR>", opts)
    keymap("n", "<leader>b", ":Pick buffers<CR>", opts)

    -- netrw
    keymap("n", "<leader>e", ":Lexplore<CR>", opts)

    -- lsp
    keymap("n", "gd", vim.lsp.buf.definition, opts)
    keymap("n", "gr", vim.lsp.buf.references, opts)
    keymap("n", "gD", vim.lsp.buf.declaration, opts)
    keymap("n", "gT", vim.lsp.buf.type_definition, opts)
    keymap("n", "K", require("core.lsp").hover, opts)
    keymap("n", "<space>mv", vim.lsp.buf.rename, opts)
    keymap("n", "<space>ca", vim.lsp.buf.code_action, opts)
    keymap("n", "<C-k>", vim.diagnostic.goto_prev, opts)
    keymap("n", "<C-j>", vim.diagnostic.goto_next, opts)
end

return M
