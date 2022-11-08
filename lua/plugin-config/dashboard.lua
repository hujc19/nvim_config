local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("没有找到 dashboard")
  return
end

db.custom_footer = {
  "",
  "",
  "",
  "by jesse hu",
  "",
  "",
  "",
}

db.custom_center = {
  {
    icon = "  ",
    desc = "Recently session                     ",
    action = "Telescope possession list",
  },
  -- {
  --   icon = "  ",
  --   desc = "Projects                            ",
  --   action = "Telescope projects",
  -- },
  {
    icon = "  ",
    desc = "Recently files                       ",
    action = "Telescope oldfiles",
  },
  {
    icon = "  ",
    desc = "Edit keybindings                     ",
    action = "edit ~/.config/nvim/lua/keybindings.lua",
  },
  -- {
  --   icon = "侀 ",
  --   desc = "Edit Projects                       ",
  --   action = "edit ~/.local/share/nvim/project_nvim/project_history",
  -- },
  -- {
  --   icon = "  ",
  --   desc = "Edit .zshrc                        ",
  --   action = "edit ~/.zshrc",
  -- },
  {
    icon = "  ",
    desc = "Edit init.lua                        ",
    action = "edit ~/.config/nvim/init.lua",
  },
  -- {
  --   icon = "  ",
  --   desc = "Find file                           ",
  --   action = "Telescope find_files",
  -- },
  {
    icon = "  ",
    desc = "Edit dashboard                       ",
    action = "edit ~/.config/nvim/lua/plugin-config/dashboard.lua",
  },
}

db.custom_header = {
  [[]],
  [[]],
  [[]],
  [[]],
  [[]],
  [[]],
  [[]],
  [[██████   ██████  ██████   ██████  ███████ ███████ ███    ██ ███████ ███████ ]],
  [[██   ██ ██    ██ ██   ██ ██    ██ ██      ██      ████   ██ ██      ██      ]],
  [[██████  ██    ██ ██████  ██    ██ ███████ █████   ██ ██  ██ ███████ █████   ]],
  [[██   ██ ██    ██ ██   ██ ██    ██      ██ ██      ██  ██ ██      ██ ██      ]],
  [[██   ██  ██████  ██████   ██████  ███████ ███████ ██   ████ ███████ ███████ ]],
  [[]],
  [[]],
  [[]],
  [[]],
  [[]],
  [[]],
  [[]],
  [[]],
  [[]],
}
db.confirm_key = "o"
db.hide_tabline = false
local home = "/home/sti"
db.session_directory = home .. "/.config/nvim/session.vim"
db.session_auto_save_on_exit = true
db.session_verbose = true
db.header_pad = 1
db.center_pad = 1 -- number type default is 1
db.footer_pad = 1 -- number type default is 1
