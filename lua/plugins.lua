-- 自动安装packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })

  local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
  if not string.find(vim.o.runtimepath, rtp_addition) then
    vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
  end
  vim.notify("Pakcer.nvim 安装完毕")
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("没有安装 packer.nvim")
  return
end

packer.startup({
  function(use)
    -- Packer 插件管理器
    use("wbthomason/packer.nvim")

    -------------------- 插件列表 -------------------------------------------------

    -------------------- colorschemes颜色主题 ------------
    -- tokyonight
    use("folke/tokyonight.nvim")
    -- zephyr
    use("glepnir/zephyr-nvim")
    -- sonokai
    use("sainnhe/sonokai")
    -- gruvbox
    use("ellisonleao/gruvbox.nvim")
    -- catppuccin
    use({ "catppuccin/nvim", as = "catppuccin" })
    -------------------- 通用插件 ------------------------
    -- 侧边文件浏览器
    use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
    -- 顶部标签页
    use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons", "moll/vim-bbye" })
    -- 底部信息显示栏
    use({ "nvim-lualine/lualine.nvim", requires = "kyazdani42/nvim-web-devicons" })
    use("arkav/lualine-lsp-progress")
    -- 模糊查找
    use({ "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim" })
    use("LinArcX/telescope-env.nvim")
    use("nvim-telescope/telescope-ui-select.nvim")
    -- 启动页
    use("glepnir/dashboard-nvim")
    -- 项目管理
    use("ahmedkhalf/project.nvim")
    -- 通知弹出
    use("rcarriga/nvim-notify")
    -- 缩进对齐线
    use("lukas-reineke/indent-blankline.nvim")
    -- 注释
    use("numToStr/Comment.nvim") --代码注释
    use("folke/todo-comments.nvim") --TODO注释
    -- 自动补全括号
    use("windwp/nvim-autopairs")
    -- lsp进程UI
    use("j-hui/fidget.nvim")
    -- 自动返回上次修改处
    use("ethanholz/nvim-lastplace")
    -- 剪切板管理
    use("AckslD/nvim-neoclip.lua")
    -- git图标
    use("lewis6991/gitsigns.nvim")
    -- zen模式
    use("folke/zen-mode.nvim")
    -- venn画图
    use("jbyuki/venn.nvim")
    -- nvim-surround
    use("kylechui/nvim-surround")
    -- toggleterm
    use("akinsho/toggleterm.nvim")
    -- markdown 管理
    use("jakewvincent/mkdnflow.nvim")
    -- sudo权限读取
    use("lambdalisue/suda.vim")
    -- markdown
    use("iamcco/markdown-preview.nvim")
    -- 插件启动时间
    use("lewis6991/impatient.nvim")
    -- neovim-cmake
    use("hujc19/neovim-cmake")
    -- navic
    use({ "SmiteshP/nvim-navic", require = "nevim/nvim-lspconfig" })
    -- ssession manager
    use("jedrzejboczar/possession.nvim")
    -- git
    use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
    ------------------- LSP ------------------------
    -- installer
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    -- Lspconfig
    use("neovim/nvim-lspconfig")
    -- 补全引擎
    use("hrsh7th/nvim-cmp")
    -- Snippet 引擎
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    -- 补全源
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- neovim内置lsp补全
    use("hrsh7th/cmp-buffer") -- buffer补全
    use("hrsh7th/cmp-path") -- 路径补全
    use("hrsh7th/cmp-cmdline") -- 命令行补全
    use("hrsh7th/cmp-nvim-lsp-signature-help") -- lsp签名补全
    -- 常见编程语言代码段
    use("rafamadriz/friendly-snippets")
    -- UI 增强
    use("onsails/lspkind-nvim")
    use("tami5/lspsaga.nvim")
    -- 代码格式化
    -- use("mhartington/formatter.nvim")
    use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
    -- TypeScript 增强
    use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })
    -- Lua 增强
    use("folke/neodev.nvim")
    -- JSON 增强
    use("b0o/schemastore.nvim")
    -- Rust 增强
    use("simrat39/rust-tools.nvim")
    -- nvim-dap
    use("mfussenegger/nvim-dap")
    use("theHamsta/nvim-dap-virtual-text")
    use("rcarriga/nvim-dap-ui")
    -------- 代码高亮 ----------------
    -- treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      requires = {
        "p00f/nvim-ts-rainbow",
        "JoosepAlviste/nvim-ts-context-commentstring",
        "windwp/nvim-ts-autotag",
        "nvim-treesitter/nvim-treesitter-refactor",
        "nvim-treesitter/nvim-treesitter-textobjects",
      },
    })

    --------------------------------------------------
    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end,
  -------------------- packer配置 --------------------
  config = {
    -- 锁定插件版本在snapshots目录
    snapshot_path = require("packer.util").join_paths(vim.fn.stdpath("config"), "snapshots"),
    -- 这里锁定插件版本在v1，不会继续更新插件
    -- snapshot = require("packer.util").join_paths(vim.fn.stdpath("config"), "snapshots") .. "/v1",
    -- snapshot = "v1",
    -- 并发数限制
    max_jobs = 16,
    -- 自定义源
    git = {
      -- default_url_format = "https://hub.fastgit.xyz/%s",
      -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
      -- default_url_format = "https://gitcode.net/mirrors/%s",
      -- default_url_format = "https://gitclone.com/github.com/%s",
    },
    -- 浮动窗口
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
})

-------------------- 文件配置 --------------------
-- 每次保存 plugins.lua 自动安装插件
--pcall(
--  vim.cmd
--  [[
--    augroup packer_user_config
--    autocmd!
--    autocmd BufWritePost plugins.lua source <afile> | PackerSync
--    augroup end
--    ]]
--)
