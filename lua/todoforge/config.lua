local M = {}

M.defaults = {
  todo_file = vim.fn.stdpath("data") .. "/todoforge/todo.md",
  keymaps = {
    open = "<leader>tdf",
    float = {
      quit = "q",
      save = "<C-s>",
    },
  },
}

M.options = {}

function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, opts or {})
end

return M
