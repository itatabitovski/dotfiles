vim.cmd("let g:netrw_liststyle = 3")
vim.cmd("let g:loaded_ruby_provider = 0")
vim.cmd("let g:loaded_node_provider = 0")
vim.cmd("let g:loaded_perl_provider = 0")


vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8

vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")

vim.opt.number = true
vim.opt.relativenumber = false

vim.opt.cursorline = true
vim.opt.colorcolumn = "80,120"

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.backspace = "indent,eol,start"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.updatetime = 50

vim.opt.swapfile = false
vim.opt.backup = false


py3venv = vim.fn.stdpath("data") .. "/.py3venv"
if not vim.loop.fs_stat(py3venv) then
  vim.fn.system({
    "python",
    "-m",
    "venv",
    py3venv,
  })
  vim.fn.system({
    py3venv .. "/bin/pip",
    "install",
    "pynvim"
  })
end
vim.g.python3_host_prog = py3venv .. "/bin/python"
