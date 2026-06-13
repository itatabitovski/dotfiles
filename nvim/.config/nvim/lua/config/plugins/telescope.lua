return {
  "nvim-telescope/telescope.nvim", branch = "0.1.x",
  dependencies = { 
    "nvim-lua/plenary.nvim",
  },
  
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        file_ignore_patterns = { "node_modules", ".git/" },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    })

    vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    vim.keymap.set("n", "<M-p>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    vim.keymap.set("n", "<M-P>", "<cmd>Telescope live_grep<cr>", { desc = "Live grep files in cwd" })
  end
}
