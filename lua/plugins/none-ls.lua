return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function(_, opts)
      local null_ls = require("null-ls")

      local function bin_or_default(bin_name, default_cmd)
        if vim.fn.filereadable("./bin/" .. bin_name) == 1 then
          return "./bin/" .. bin_name
        end
        return default_cmd
      end

      local cond_rubocop = function(utils)
        return utils.root_has_file({ "Gemfile", ".rubocop.yml", ".rubocop.yaml" })
          or utils.executable("rubocop")
          or vim.fn.filereadable("./bin/rubocop") == 1
      end

      local cond_erblint = function(utils)
        return utils.root_has_file({ "Gemfile", ".erb-lint.yml", ".erb-lint.yaml", "app/views" })
          or utils.executable("erblint")
          or vim.fn.filereadable("./bin/erblint") == 1
      end

      local rubocop_diag = null_ls.builtins.diagnostics.rubocop.with({
        command = bin_or_default("rubocop", nil),
        condition = cond_rubocop,
      })

      local erblint_diag = null_ls.builtins.diagnostics.erb_lint.with({
        command = bin_or_default("erblint", nil),
        condition = cond_erblint,
      })

      opts.sources = vim.list_extend(opts.sources or {}, { rubocop_diag, erblint_diag })
    end,
  },
}
