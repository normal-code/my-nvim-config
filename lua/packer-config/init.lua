-- -- Autocmd that reloads neovim whenever you save this file
-- vim.cmd[[
--     augroup packer-config
--         autocmd!
--         autocmd BufWritePost init.lua source <afile> | PackerSync
--     augroup end
-- ]]


return require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- packer en sí

    -- Neovim's plugins
    use "EdenEast/nightfox.nvim" -- tema para Neovim
    use 'kyazdani42/nvim-web-devicons' -- optional, for file icons
    use 'kyazdani42/nvim-tree.lua' -- nvim-tree, navegador de archivos
    use 'rcarriga/nvim-notify' -- notify, ventana de notificaciones
    use 'nvim-lualine/lualine.nvim' -- lualine, da estilo a la barra de estado
    use 'romgrk/barbar.nvim' -- barbar, a tabline plugin
    use 'numToStr/Comment.nvim' -- comment, a comment plugin
    use 'JoosepAlviste/nvim-ts-context-commentstring' --support on comments to ts languages
    use 'ggandor/leap.nvim' -- leap, a motion nvim plugin
    use 'windwp/nvim-autopairs' -- autopair for parenthesis an others
    use "akinsho/toggleterm.nvim"       -- toggleterm, open terminal from Neovim

    -- Treesiter's plugins
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- Treesitter, better highlighting
    use 'nvim-treesitter/nvim-treesitter-refactor' -- Treesitter module, highlight definitions, navigation and rename
    use 'nvim-treesitter/playground' -- Playground, view Treesitter information direcly in neovim
    use 'windwp/nvim-ts-autotag' -- Autopair for HTML an some languages
    use 'p00f/nvim-ts-rainbow' -- Parenthesis and similar are colored

    -- Telescope's plugins
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'nvim-lua/popup.nvim'
    use 'nvim-telescope/telescope-media-files.nvim'

    -- cmp's plugins
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'onsails/lspkind.nvim' -- Icons for LSP nvim-cmp
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'hrsh7th/cmp-cmdline' -- Autocompletion for the commandline of neovim
    use 'hrsh7th/cmp-path' -- Autocompletion for the paths
    use 'hrsh7th/cmp-buffer' -- Autocompletion for buffer's words
    use 'hrsh7th/cmp-nvim-lua' -- Autocompletion for the lua API of neovim

    -- snips plugins
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use "rafamadriz/friendly-snippets" -- Collection of snippets of many languages

    -- LSP's plugins
    use "williamboman/nvim-lsp-installer" --lsp-installer, this will install lsp on neovim
    use 'neovim/nvim-lspconfig' -- lsp-config, conjunto de configuraciones de lsp's para neovim
    -- use 'onsails/diaglist.nvim' -- diagnostics in quickfix and loclist
    use 'jose-elias-alvarez/null-ls.nvim'       -- Diagnostics and formatter for lsp-languages

    -- Git
    use 'lewis6991/gitsigns.nvim'
end)
