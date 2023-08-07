vim.opt.termguicolors = true

vim.opt.mouse = "a"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.colorcolumn = "80,120"

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


vim.api.nvim_create_autocmd(
    {"BufWritePre"},
    {
        pattern = {"*"},
        command = [[:%s/\s\+$//e]],
    }
)
