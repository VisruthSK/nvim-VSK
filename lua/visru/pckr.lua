local function bootstrap_pckr()
	local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

	if not vim.uv.fs_stat(pckr_path) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/lewis6991/pckr.nvim",
			pckr_path,
		})
	end

	vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require("pckr").add({
	-- My plugins here
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		requires = { { "nvim-lua/plenary.nvim" } },
	},

	{
		"scottmckendry/cyberdream.nvim",
		config = function()
			require("cyberdream").setup({
				transparent = true,
				italic_comments = true,
				hide_fillchars = true,
				borderless_telescope = true,
				terminal_colors = true,
				-- theme = {
				-- 	colors = {
				-- 		bg = "#000000",
				-- 	},
				-- },
				extensions = {
					telescope = true,
					dashboard = true,
				},
			})
			vim.cmd("colorscheme cyberdream")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	},

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
	},

	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					python = { "isort", "black" },
					["*"] = { "typos" },
				},
			})
		end,
	},

	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup({
				-- ... other config
				options = {
					theme = "auto", -- "auto" will set the theme dynamically based on the colorscheme
				},
				-- ... other config
			})
		end,
	},
	{
		"m4xshen/autoclose.nvim",
		config = function()
			require("autoclose").setup()
		end,
	},
	"williamboman/mason-lspconfig.nvim",
	"williamboman/mason.nvim",
	"neovim/nvim-lspconfig",
	"mbbill/undotree",
	"tpope/vim-fugitive",
	"HiPhish/rainbow-delimiters.nvim",
	"Luxed/aw-watcher-nvim",
})
