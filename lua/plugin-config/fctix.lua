local status, _ = pcall(require, "fctix")
if not status then
  vim.notify("没有找到 fctix")
  return
end
