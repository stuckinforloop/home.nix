local M = {}

function M.setup()
    -- Don't show the big banner at the top
    vim.g.netrw_banner = 0

    -- Use a tree-style view
    vim.g.netrw_liststyle = 3
end

return M
