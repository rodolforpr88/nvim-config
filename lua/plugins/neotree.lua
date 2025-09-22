return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts = opts or {}
    opts.filesystem = opts.filesystem or {}
    opts.filesystem.filtered_items = vim.tbl_deep_extend("force",
      opts.filesystem.filtered_items or {},
      {
        visible = false,        -- 🔑 começa escondendo
        hide_dotfiles = true,   -- esconde dotfiles
        hide_gitignored = true, -- esconde gitignored
        hide_hidden = true,     -- (Windows) esconde hidden
      }
    )
    opts.window = opts.window or {}
    opts.window.mappings = vim.tbl_deep_extend("force", opts.window.mappings or {}, {
      ["H"]     = "toggle_hidden",    -- tecla H padrão
      ["<C-h>"] = "toggle_hidden",    -- também no Ctrl-H
    })
    return opts
  end,
  keys = {
    { "<C-e>", function() require("neo-tree.command").execute({ toggle = true, reveal = true }) end,
      desc = "Explorer Neo-tree (toggle + reveal)" },
  },
}
