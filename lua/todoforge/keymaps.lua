local config = require("todoforge.config")

local M = {}

function M.setup_float_keymaps(buf_handle, win_handle)
	local keys = config.options.keymaps.float

	vim.keymap.set("n", keys.quit, function()
		vim.api.nvim_win_close(win_handle, true)
	end, { buffer = buf_handle, silent = true, desc = "Close TodoForge window" })

	vim.keymap.set("n", keys.save, function()
		vim.api.nvim_buf_call(buf_handle, function()
			vim.cmd.write()
		end)
	end, { buffer = buf_handle, silent = true, desc = "Save todos" })
end

function M.setup_global_keymap(open_fn)
	vim.keymap.set("n", config.options.keymaps.open, open_fn, {
		noremap = true,
		silent = true,
		desc = "Open TodoForge floating window",
	})

	vim.api.nvim_create_user_command("Tdf", open_fn, {
		desc = "Open TodoForge floating window",
	})
end

return M
