return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'jose-elias-alvarez/null-ls.nvim'

    -- colorschemes
    use 'folke/tokyonight.nvim'
    use { "ellisonleao/gruvbox.nvim" }

    -- Deprecated 
    -- use 'EdenEast/nightfox.nvim'

    -- Treesitter
    -- USER THIS ON FIRST INSTALL: use {'nvim-treesitter/nvim-treesitter', run = function() require('nvim-treesitter.install').update({ with_sync = true }) end, }
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    -- use 'kyazdani42/nvim-tree.lua'
    
    -- nvim-tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
end)
