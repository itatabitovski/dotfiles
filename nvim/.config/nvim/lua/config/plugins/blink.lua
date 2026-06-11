return {
  {
    "saghen/blink.cmp",
    version = "*",
    opts = {
      keymap = { preset = "super-tab" },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      vim.lsp.config("ty", {
        capabilities = capabilities,
        cmd = { "uvx", "ty", "server" },
      })

      vim.lsp.config("ruff", {
        capabilities = capabilities,
      })

      vim.lsp.config("gopls", {
        capabilities = capabilities,
      })

      vim.diagnostic.config({
        virtual_text = false,
        underline = { severity = vim.diagnostic.severity.ERROR },
        float = { border = "rounded", source = true },
      })

      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          vim.diagnostic.open_float(nil, { focus = false })
        end,
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.py",
        callback = function()
          vim.lsp.buf.code_action({
            context = { only = { "source.organizeImports" } },
            apply = true,
          })
          vim.lsp.buf.format({ async = false })
        end,
      })

      vim.lsp.enable("ty")
      vim.lsp.enable("ruff")
      vim.lsp.enable("gopls")
    end,
  },
}
