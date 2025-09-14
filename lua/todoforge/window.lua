local config = require("todoforge.config")
local utils = require("todoforge.utils")
local keymaps = require("todoforge.keymaps")

local M = {}

local function win_config()
	local win_height = math.floor(vim.o.lines * 0.6)
	local win_width = math.floor(vim.o.columns * 0.6)
	local row = math.floor((vim.o.lines - win_height) / 2)
	local col = math.floor((vim.o.columns - win_width) / 2)

	return {
		relative = "editor",
		width = win_width,
		height = win_height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
		title = "TodoForge",
		title_pos = "center",
	}
end

function M.open(todo_file)
	utils.ensure_dir_exists(todo_file)

	if vim.fn.filereadable(todo_file) == 0 then
		local template = {
			"# TodoForge - Your Quick Todo Manager",
			"",
			"-- Press '" .. config.options.keymaps.float.save .. "' to save your changes.",
			"-- Press '" .. config.options.keymaps.float.quit .. "' to close this window.",
			"---------------------------------------------",
			"",
			"- [x] Install an awesome Neovim plugin called Todoforge.nvim",
			"",
		}
		vim.fn.writefile(template, todo_file)
	end

	local buf_handle = vim.fn.bufadd(todo_file)
	vim.fn.bufload(buf_handle)

	vim.bo[buf_handle].buflisted = true
	vim.bo[buf_handle].swapfile = false
	vim.bo[buf_handle].modified = false

	-- detect filetype dynamically
	local ft = vim.filetype.match({ filename = todo_file })
	if ft then
		vim.bo[buf_handle].filetype = ft
	end

	local win_handle = vim.api.nvim_open_win(buf_handle, true, win_config())
	keymaps.setup_float_keymaps(buf_handle, win_handle)
end

return M
