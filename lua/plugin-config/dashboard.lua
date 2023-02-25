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
vim.notify("=============ok")

db.custom_center = {
  {
    icon = "  ",
    desc = "Recently Session                     ",
    action = "Telescope possession list",
  },
  {
    icon = "  ",
    desc = "Recently Files                       ",
    action = "Telescope oldfiles",
  },
  {
    -- icon = "  ",
    icon = "  ",
    desc = "Projects                             ",
    action = "Telescope projects",
  },
  {
    icon = "  ",
    desc = "Keybindings                          ",
    action = "edit ~/.config/nvim/lua/uConfig.lua",
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
  -- {
  --   icon = "  ",
  --   desc = "Edit init.lua                        ",
  --   action = "edit ~/.config/nvim/init.lua",
  -- },
  {
    icon = "  ",
    desc = "Find file                             ",
    action = "Telescope live_grep",
  },
  {
    icon = "ﯯ  ",
    desc = "Dashboard                            ",
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
db.hide_tabline = true
local home = "/home/sti"
db.session_directory = home .. "/.config/nvim/session.vim"
db.session_auto_save_on_exit = true
db.session_verbose = true
db.header_pad = 1
db.center_pad = 1 -- number type default is 1
db.footer_pad = 1 -- number type default is 1
