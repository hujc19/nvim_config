local status_ok, notify = pcall(require, "notify")
if not status_ok then
  vim.notify("没有找到 nvim-notify")
  return
end

notify.setup({
  stages = "slide",
  timeout = 5000,
})
vim.notify = notify
