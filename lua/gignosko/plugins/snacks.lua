return {
  "folke/snacks.nvim",
  keys = {
    { "<leader>sc",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    { "<c-/>",      function() Snacks.terminal.toggle() end, desc = "Toggle Terminal" },
    { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
  },
  opts = {
    scratch = {
      -- your scratch configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
   
      enabled = true
    },
    terminal = {
      enabled = true
    }
  }
}
