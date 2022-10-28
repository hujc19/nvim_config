local status_mason, mason = pcall(require, "mason")
if not status_mason then
  vim.notify("没有找到 mason")
  return
end

local status_mason_lspconfig, _ = pcall(require, "mason-lspconfig")
if not status_mason_lspconfig then
  vim.notify("没有找到 mason-lspconfig")
  return
end

local status_lspconfig, lspconfig = pcall(require, "lspconfig")
if not status_lspconfig then
  vim.notify("没有找到 lspconfig")
  return
end

local status_ui, _ = pcall(require, "lsp.ui")
if not status_ui then
  vim.notify("没有找到 ui.lua")
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
mason.setup({
  ensure_installed = {
    "sumneko_lua",
    "clangd",
    "jsonls",
    "pyright",
    "cmake",
    "marksman",
    "bashls",
    "yamlls",
  },
})

-- 安装列表
-- { key: 服务器名， value: 配置文件 }
-- key 必须为下列网址列出的 server name，不可以随便写
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
  sumneko_lua = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
  clangd = require("lsp.config.clangd"),
  jsonls = require("lsp.config.json"),
  pyright = require("lsp.config.pyright"),
  cmake = require("lsp.config.cmake"),
  marksman = require("lsp.config.markdown"),
  bashls = require("lsp.config.bash"),
  yamlls = require("lsp.config.yamlls"),
}

for name, config in pairs(servers) do
  if config ~= nil and type(config) == "table" then
    -- 自定义初始化配置文件必须实现on_setup 方法
    config.on_setup(lspconfig[name])
  else
    -- 使用默认参数
    lspconfig[name].setup({})
  end
end
