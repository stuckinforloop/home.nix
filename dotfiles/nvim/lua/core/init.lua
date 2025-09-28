local M = {}

local autocmds = require("core.autocmds")
local keymaps = require("core.keymaps")
local lsp = require("core.lsp")
local netrw = require("core.netrw")
local options = require("core.options")

function M.setup()
    -- set options
    options.setup()

    -- set keybinds
    keymaps.setup()

    -- setup LSP
    lsp.setup()

    -- setup autocmds
    autocmds.setup()

    netrw.setup()
end

return M
