local M = {}

function M.ensure_dir_exists(filepath)
  local dir = vim.fn.fnamemodify(filepath, ":h")
  if vim.fn.isdirectory(dir) == 0 then
    vim.fn.mkdir(dir, "p")
    vim.schedule(function()
      vim.notify("TodoForge: Created directory at " .. dir, vim.log.levels.INFO)
    end)
  end
end

return M
