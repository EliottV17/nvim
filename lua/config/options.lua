-- Options are automatically loaded before lazy.nvim startup.
require("config.remote_clipboard").setup()

vim.opt.relativenumber = true
vim.g.autoformat = false
vim.opt.clipboard = "unnamedplus"
if vim.fn.executable("fish") == 1 then
  vim.o.shell = "fish"
end
