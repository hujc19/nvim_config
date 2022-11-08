local colorscheme = "gruvbox"
-- tokyonight
-- zephyr
-- sonokai
-- gruvbox
-- catppuccin
-- TODO:colorscheme not to do
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme: " .. colorscheme .. " 没有找到！")
  return
end
