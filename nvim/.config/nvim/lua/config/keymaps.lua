vim.g.mapleader = " "


vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab

vim.keymap.set("n", "<LeftRelease>", function()
  local pos = vim.fn.getmousepos()
  local winid = vim.fn.win_getid(pos.winid)
  if pos.col == 0 and vim.fn.foldclosed(pos.line) ~= -1 then
    vim.cmd("normal! zo")
  elseif pos.col == 0 and vim.fn.foldlevel(pos.line) > 0 then
    vim.cmd("normal! zc")
  end
end, { desc = "Mouse click to toggle fold" })
