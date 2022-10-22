require("utils.global")

-- 基础设置
require("basic")
-- 快捷键映射
require("keybindings")
-- 插件管理
require("plugins")
-- 插件配置
require("plugin-config")
-- 主题设置
require("colorscheme")
-- 自动命令
require("autocmds")

-- 内置LSP
require("lsp.setup")
-- 自动补全
require("cmp.setup")
-- 格式化
require("format.setup")
