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
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"nvim-telescope/telescope.nvim", tag = "0.1.3",
		dependencies = { "nvim-lua/plenary.nvim" },
        file_ignore_patterns = {
            "^build/",
            "^%_build/",
            "^%_opam/",
            "^%.git/"
        }
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent"
            }
        },
	},
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate"
	},
    {
        "folke/ts-comments.nvim",
        opts = {},
        event = "VeryLazy",
        enabled = vim.fn.has("nvim-0.10.0") == 1,
    },
	{
		"nvim-treesitter/playground"
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" }
	},
	{
		"theprimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
	},
	{
		"mbbill/undotree"
	},
	{
		"tpope/vim-fugitive"
	},
    {
        "mrcjkb/haskell-tools.nvim",
        version = "^4",
        lazy = false,
    },
	{
		"williamboman/mason.nvim",
		lazy = false
	},
	{
		"williamboman/mason-lspconfig.nvim"
	},
	{
		{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},

		--- Uncomment these if you want to manage LSP servers from neovim
		{
			'williamboman/mason.nvim',
			lazy = false
		},
		{
			'williamboman/mason-lspconfig.nvim'
		},

		-- LSP Support
		{
			'neovim/nvim-lspconfig',
			dependencies = {
				{'hrsh7th/cmp-nvim-lsp'},
			},
		},

		-- Autocompletion
		{
			'hrsh7th/nvim-cmp',
			dependencies = {
				{'L3MON4D3/LuaSnip'},
			}
		}
	}
})
