local packer = require("packer")
packer.startup(function(use)
	-- Packer 可以管理自己本身
	use("wbthomason/packer.nvim")

	--------------------- colorschemes --------------------
	-- tokyonight
	use("folke/tokyonight.nvim")
	-------------------------------------------------------
	-- nvim-tree (新增)
	use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
	-- bufferline (新增)
	use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
	-- lualine (新增)
	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
	use("arkav/lualine-lsp-progress")
	-- telescope （新增）
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
	-- telescope extensions
	use("LinArcX/telescope-env.nvim")
	-- dashboard-nvim (新增)
	use("glepnir/dashboard-nvim")
	-- project
	use("ahmedkhalf/project.nvim")
	-- treesitter （新增）
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	--------------------- LSP --------------------
	-- use("williamboman/nvim-lsp-installer")
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	-- Lspconfig
	use({ "neovim/nvim-lspconfig" })

	-- 补全引擎
	use("hrsh7th/nvim-cmp")
	-- snippet 引擎
	use("hrsh7th/vim-vsnip")
	-- 补全源
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
	use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
	use("hrsh7th/cmp-path") -- { name = 'path' }
	use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

	-- 常见编程语言代码段
	use("rafamadriz/friendly-snippets")
	use("tami5/lspsaga.nvim")
	-- 代码格式化
	-- use("mhartington/formatter.nvim")
	use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
	-- JSON 增强
	use("b0o/schemastore.nvim")
	-- TS 增强
	use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })
	-- Rust 增强
	use("simrat39/rust-tools.nvim")
	-- Clangd 增强
	use("p00f/clangd_extensions.nvim")

	-- surround
	use("ur4ltz/surround.nvim")
	-- Comment
	use("numToStr/Comment.nvim")
	-- nvim-autopairs
	use("windwp/nvim-autopairs")

	-- 代码运行器
	use("CRAG666/code_runner.nvim")
end)

-- 每次保存 plugins.lua 自动安装插件
pcall(
	vim.cmd,
	[[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
