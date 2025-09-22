return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = { lsp_fallback = false, timeout_ms = 3000 },
    formatters_by_ft = {
      ruby  = { "rubocop" },
      eruby = { "rubocop" },
    },
    -- usar o formatter embutido do Conform e só trocar o comando p/ binstub
    formatters = {
      rubocop = {
        command = function()
          return (vim.fn.filereadable("./bin/rubocop") == 1) and "./bin/rubocop" or "rubocop"
        end,
        env = { RUBOCOLOR = "0" },
      },
    },
  },
}
