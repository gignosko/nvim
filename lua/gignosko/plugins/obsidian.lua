return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  ft = "markdown",
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in the next major release
    note_id_func = ( function(title)
        return title:gsub(' ', '-'):gsub('\\[\\^A-Za-z0-9-\\]', ''):lower()
    end),
    workspaces = {
      {
        name = "personal",
        path = "~/OneDrive - CoverMyMeds/Documents/obsidian/cmm/knowledge_base/",
      },
      -- {
      --   name = "work",
      --   path = "~/vaults/work",
      -- },
    },
    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
    },
    daily_notes = {
      folder = "daily_notes",
      date_format = "%Y-%m-%d-%a",
      default_tags = { "daily-notes" },
      workdays_only = true,
    },
    attachments = {
      folder = "attachments",
      img_name_func = function()
        return string.format("Pasted image %s", os.date "%Y%m%d%H%M%S")
      end,
      confirm_img_paste = true,
    },
  },
  keys = {
    { "<leader>zn", "<cmd>Obsidian new <CR>", desc = "Obsidian new note" },
    { "<leader>zs", "<cmd>Obsidian search <CR>", desc = "Obsidian search notes" },
    { "<leader>zt", "<cmd>Obsidian tags <CR>", desc = "Obsidian search tags" },
    { "<leader>zc", "<cmd>Obsidian toggle_checkbox <CR>", desc = "Obsidian toggle checkbox" },
  }
}
