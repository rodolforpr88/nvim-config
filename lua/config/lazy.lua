-- ~/.config/nvim/lua/config/lazy.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  rocks = { enabled = false },
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- Extras (usamos o máximo possível)
    { import = "lazyvim.plugins.extras.lang.ruby" },     -- ruby_lsp, erbls, treesitter ruby/erb
    { import = "lazyvim.plugins.extras.lsp.none-ls" },   -- integra none-ls no pipeline do LazyVim
    { import = "lazyvim.plugins.extras.test.core" },     -- neotest + UI

    -- Seus plugins/overrides
    { import = "plugins" },
  },
  defaults = { lazy = false, version = false },
  install  = { colorscheme = { "tokyonight", "habamax" } },
  checker  = { enabled = true, notify = false },
  performance = {
    rtp = { disabled_plugins = { "gzip", "tarPlugin", "tohtml", "tutor", "zipPlugin" } },
  },
})
