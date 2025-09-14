local config = require("todoforge.config")
local keymaps = require("todoforge.keymaps")
local window = require("todoforge.window")

local M = {}

function M.setup(opts)
	config.setup(opts)

	local todo_file = vim.fn.expand(config.options.todo_file)
	keymaps.setup_global_keymap(function()
		window.open(todo_file)
	end)
end

return M
