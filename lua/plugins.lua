-- 自动安装packer
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
  local rtp_addition = vim.fn.stdpath("data") .. "/lazy/*"
  if not string.find(vim.o.runtimepath, rtp_addition) then
    vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
  end
  vim.notify("Lazy.nvim 安装完毕")
end
vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  vim.notify("没有安装 lazy.nvim")
  return
end

require("lazy").setup({

    -------------------- 插件列表 -------------------------------------------------
    -------------------- colorschemes颜色主题 ------------
    "folke/tokyonight.nvim",
    "glepnir/zephyr-nvim",
    "sainnhe/sonokai",
    "ellisonleao/gruvbox.nvim",
    {"catppuccin/nvim", name = "catppuccin"},
    -------------------- 通用插件 ------------------------
    -- 侧边文件浏览器
    {"nvim-tree/nvim-tree.lua", dependencies = "nvim-tree/nvim-web-devicons", version = "nightly"},
    -- 顶部标签页
    {"akinsho/bufferline.nvim", dependencies = {"nvim-tree/nvim-web-devicons", "moll/vim-bbye"}},
    -- 底部信息显示栏
    {"nvim-lualine/lualine.nvim", dependencies = "nvim-tree/nvim-web-devicons"},
    "arkav/lualine-lsp-progress",
    -- 模糊查找
    { "nvim-telescope/telescope.nvim", dependencies = "nvim-lua/plenary.nvim" },
    "LinArcX/telescope-env.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    -- 启动页
    "glepnir/dashboard-nvim",
    -- 项目管理
    "ahmedkhalf/project.nvim",
    -- 通知弹出
    "rcarriga/nvim-notify",
    -- 缩进对齐线
    "lukas-reineke/indent-blankline.nvim",
    -- 注释
    "numToStr/Comment.nvim",
    --TODO注释
    "folke/todo-comments.nvim",
    -- 自动补全括号
    "windwp/nvim-autopairs",
    -- lsp进程UI
    -- {"j-hui/fidget.nvim", version = "legacy"},
    {
        "j-hui/fidget.nvim",
          tag = "legacy",
            event = "LspAttach",
              opts = {
                    -- options
                      },
                     },

    -- 自动返回上次修改处
    "ethanholz/nvim-lastplace",
    -- 剪切板管理
    "AckslD/nvim-neoclip.lua",
    "kkharji/sqlite.lua",
    -- git图标
    "lewis6991/gitsigns.nvim",
    -- zen模式
    "folke/zen-mode.nvim",
    -- venn画图
    "jbyuki/venn.nvim",
    -- nvim-surround
    "kylechui/nvim-surround",
    -- toggleterm
    "akinsho/toggleterm.nvim",
    -- markdown 管理
    "jakewvincent/mkdnflow.nvim",
    -- sudo权限读取
    "lambdalisue/suda.vim",
    -- markdown
    "iamcco/markdown-preview.nvim",
    -- neovim-cmake
    "hujc19/neovim-cmake",
    -- navic
    {"SmiteshP/nvim-navic", require = "nevim/nvim-lspconfig"},
    -- ssession manager
    "jedrzejboczar/possession.nvim",
    -- git
    --{"TimUntersberger/neogit", dependencies  = "nvim-lua/plenary.nvim"},
    {"kdheepak/lazygit.nvim", dependencies = "nvim-lua/plenary.nvim"},
    -- bazel
    --{"alexander-born/bazel.nvim", dependencies = {"nvim-treesitter/nvim-treesitter"} },
    -- distant


    -- fcitx输入法切换
    "h-hg/fcitx.nvim",
    --scroll
    "petertriho/nvim-scrollbar",
    -- Markdown code block compiler
    "jubnzv/mdeval.nvim",
    "simrat39/symbols-outline.nvim",
    { "CRAG666/code_runner.nvim", dependencies  = "nvim-lua/plenary.nvim" },
    -- diffview
    -- use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
    -- ros-nvim
    "thibthib18/ros-nvim",
    -- docker
    "jamestthompson3/nvim-remote-containers",
    --use({ "https://codeberg.org/esensar/nvim-dev-container" })
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
      end,
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    },

    ------------------- LSP ------------------------
    -- installer
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- Lspconfig
    "neovim/nvim-lspconfig",
    -- 补全引擎
    "hrsh7th/nvim-cmp",
    -- Snippet 引擎
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    -- 补全源
    "hrsh7th/cmp-vsnip",
    "hrsh7th/cmp-nvim-lsp", -- neovim内置lsp补全
    "hrsh7th/cmp-buffer", -- buffer补全
    "hrsh7th/cmp-path", -- 路径补全
    "hrsh7th/cmp-cmdline", -- 命令行补全
    "hrsh7th/cmp-nvim-lsp-signature-help", -- lsp签名补全
    -- 常见编程语言代码段
    "rafamadriz/friendly-snippets",
    -- UI 增强
    "onsails/lspkind-nvim",
    "tami5/lspsaga.nvim",
    -- 代码格式化
    -- use("mhartington/formatter.nvim")
    {"jose-elias-alvarez/null-ls.nvim", dependencies   = "nvim-lua/plenary.nvim" },
    -- TypeScript 增强
    {"jose-elias-alvarez/nvim-lsp-ts-utils", dependencies    = "nvim-lua/plenary.nvim" },
    -- Lua 增强
    "folke/neodev.nvim",
    -- JSON 增强
    "b0o/schemastore.nvim",
    -- Rust 增强
    "simrat39/rust-tools.nvim",
    -- nvim-dap
    "mfussenegger/nvim-dap",
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",

    -------- 代码高亮 ----------------
    -- treesitter
    -- {
      -- "nvim-treesitter/nvim-treesitter",
      -- dependencies     = {
        -- "p00f/nvim-ts-rainbow",
        -- "JoosepAlviste/nvim-ts-context-commentstring",
        -- "windwp/nvim-ts-autotag",
       --  "nvim-treesitter/nvim-treesitter-refactor",
        -- "nvim-treesitter/nvim-treesitter-textobjects",
      -- },
      -- build = ":TSUpdate",
    -- }

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
