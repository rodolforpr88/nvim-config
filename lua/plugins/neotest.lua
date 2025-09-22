return {
  {
    "nvim-neotest/neotest",
    dependencies = { "olimorris/neotest-rspec" },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      table.insert(opts.adapters, require("neotest-rspec")({
        rspec_cmd = function()
          if vim.fn.filereadable("./bin/rspec") == 1 then return { "./bin/rspec" } end
          return { "bundle", "exec", "rspec" }
        end,
      }))
    end,
    keys = {
      { "<leader>tt", function() require("neotest").run.run() end, desc = "Run nearest test" },
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run file tests" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle test summary" },
      { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Open test output" },
    },
  },
}
