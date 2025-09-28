local M = {}

-- Exported hover function to be used in keymaps
function M.hover()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if not clients or vim.tbl_isempty(clients) then
        vim.notify("No LSP attached for hover", vim.log.levels.INFO)
        return
    end
    vim.lsp.buf.hover()
end

function M.setup(opts)
    opts = opts or {}
    local overrides = opts.overrides or {}
    local disabled = {}
    for _, name in ipairs(opts.disable or {}) do
        disabled[name] = true
    end

    vim.diagnostic.config({
        virtual_lines = true,
        virtual_text = false,
        signs = true,
        update_in_insert = true,
        severity_sort = true,
    })

    -- Enforce dynamic hover window size (80% width, 30% height) every time
    local default_hover = vim.lsp.handlers.hover
    vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, config)
        local width = math.floor(vim.o.columns * 0.8)
        local height = math.floor(vim.o.lines * 0.3)
        config = vim.tbl_extend("force", config or {}, {
            border = "rounded",
            focus_id = "hover",
            focusable = true,
            anchor_bias = "auto",
        })
        local bufnr, winnr = default_hover(err, result, ctx, config)
        if winnr and vim.api.nvim_win_is_valid(winnr) then
            pcall(vim.api.nvim_win_set_width, winnr, width)
            pcall(vim.api.nvim_win_set_height, winnr, height)
        end
        return bufnr, winnr
    end

    -- Auto-discover and register servers from runtimepath at 'lsp/*.lua'
    local files = vim.api.nvim_get_runtime_file("lsp/*.lua", true)
    local servers = {}
    for _, path in ipairs(files) do
        local name = path:match("([^/]+)%.lua$")
        if name and not disabled[name] then
            local ok, cfg = pcall(dofile, path)
            if ok and type(cfg) == "table" then
                local merged = vim.tbl_deep_extend("force", cfg, overrides[name] or {})
                vim.lsp.config[name] = merged
                table.insert(servers, name)
            else
                vim.notify("Failed loading LSP server config: " .. path, vim.log.levels.WARN)
            end
        end
    end
    if #servers > 0 then
        vim.lsp.enable(servers)
    end
end

return M
