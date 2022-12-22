local status, lualine = pcall(require, "lualine")
if not status then
  vim.notify("没有找到 lualine")
  return
end

local navic = require("nvim-navic")
local function session_name()
  return require("possession.session").session_name or ""
end

lualine.setup({
  options = {
    theme = "auto",
    component_separators = { left = "|", right = "|" },
    -- https://github.com/ryanoasis/powerline-extra-symbols
    section_separators = { left = " ", right = "" },
  },
  extensions = { "nvim-tree", "toggleterm" },
  sections = {
    -- 注释掉，使用fidget
    -- lualine_c = {
    --   { {
    --     navic.get_location,
    --     cond = true,
    --   } },
    -- },
    lualine_c = {
      { "filename" },
      --   { navic.get_location, cond = navic.is_available, padding = { left = 0, right = 1 } },
    },
    lualine_x = {
      session_name,
      -- "filename",
      {
        -- "filename",
        "fileformat",
        symbols = {
          unix = "", -- e712
          dos = "", -- e70f
          mac = "", -- e711
        },
        -- symbols = {
        --   unix = "LF",
        --   dos = "CRLF",
        --   mac = "CR",
        -- },
      },
      -- "encoding",
    },
  },
})
