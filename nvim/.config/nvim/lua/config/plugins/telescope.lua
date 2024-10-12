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
      },
    })

    vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
  end
}
