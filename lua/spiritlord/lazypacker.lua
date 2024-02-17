local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"nvim-telescope/telescope.nvim", branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{ 'rose-pine/neovim', name = 'rose-pine' },
	{
    		'nvim-treesitter/nvim-treesitter',
    		build = function()
      			require('nvim-treesitter.install').update({ with_sync = true })
    		end,
  	},
	{ 'nvim-treesitter/playground' },
	{ 'theprimeagen/harpoon' },
	{ 'mbbill/undotree' },
	{ 'tpope/vim-fugitive' },
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x', dependencies = {
		{'williamboman/mason.nvim'},
		{'williamboman/mason-lspconfig.nvim'},

		{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
		{'neovim/nvim-lspconfig'},
		{'hrsh7th/cmp-nvim-lsp'},
		{'hrsh7th/nvim-cmp'},
		{'L3MON4D3/LuaSnip'},
	}},
})
