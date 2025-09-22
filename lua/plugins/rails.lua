return {
  { "tpope/vim-rails",   ft = { "ruby", "eruby", "rake" } },
  { "tpope/vim-bundler", ft = { "ruby", "eruby", "rake" } },
  { "tpope/vim-rake",    ft = { "ruby", "rake" } },
  {
    "rgroli/other.nvim",
    ft = { "ruby", "eruby" },
    config = function()
      require("other-nvim").setup({
        mappings = {
          "rails", -- usa os presets Rails (model<->spec, controller<->spec etc.)
        },
      })
    end,
    keys = {
      { "<leader>oa", "<cmd>Other<cr>", desc = "Other (alternate file)" },
    },
  },
  -- (opcional) garantir que solargraph jamais suba:
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.solargraph = false
    end,
  },
}
