local status, possession = pcall(require, "possession")
if not status then
  vim.notify("没有找到 possession")
  return
end
possession.setup({
  -- local path_ = require("plenary.path")

  -- session_dir = (path_:new(vim.fn.stdpath("data")) / "possession"):absolute(),
  session_dir = "/home/sti/.config/nvim/session",
  silent = false,
  load_silent = true,
  debug = false,
  prompt_no_cr = false,
  autosave = {
    current = false, -- or fun(name): boolean
    tmp = false, -- or fun(): boolean
    tmp_name = "tmp",
    on_load = true,
    on_quit = true,
  },
  commands = {
    save = "SSave",
    load = "SLoad",
    close = "SClose",
    delete = "SDelete",
    show = "PossessionShow",
    list = "PossessionList",
    migrate = "PossessionMigrate",
  },
  hooks = {
    before_save = function(name)
      return {}
    end,
    after_save = function(name, user_data, aborted) end,
    before_load = function(name, user_data)
      return user_data
    end,
    after_load = function(name, user_data) end,
  },
  plugins = {
    close_windows = {
      hooks = { "before_save", "before_load" },
      preserve_layout = true, -- or fun(win): boolean
      match = {
        floating = true,
        buftype = {},
        filetype = {},
        custom = false, -- or fun(win): boolean
      },
    },
    delete_hidden_buffers = {
      hooks = {
        "before_load",
        vim.o.sessionoptions:match("buffer") and "before_save",
      },
      force = false, -- or fun(buf): boolean
    },
    nvim_tree = true,
    tabby = true,
    delete_buffers = false,
  },
})
