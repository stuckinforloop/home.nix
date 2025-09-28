vim.loader.enable()

require("config.lazy")  -- load plugins first
require("core").setup() -- setup the rest
