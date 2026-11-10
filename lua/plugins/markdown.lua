return {
  -- Desactivar el linter para archivos Markdown
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      if opts.linters_by_ft then
        opts.linters_by_ft.markdown = nil
      end
    end,
  },
  -- Alternativamente, si es el LSP el que molesta, puedes ocultar sus diagnósticos en MD
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        -- Esto evita que los errores ensucien la pantalla del editor
        virtual_text = { severity = { min = vim.diagnostic.severity.ERROR } },
        underline = { severity = { min = vim.diagnostic.severity.ERROR } },
      },
    },
  },
}

