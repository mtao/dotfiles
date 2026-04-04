local vim = vim
local Plug = vim.fn['plug#']

vim.call('call plug#begin()')
Plug('tpope/vim-projectionist'        )
Plug('tpope/vim-fugitive')
Plug('vim-scripts/taglist.vim')
Plug('rhysd/vim-clang-format')
Plug('rhysd/vim-grammarous')
Plug('vim-airline/vim-airline-themes')
Plug('chrisbra/unicode.vim')
--Plug ('HerringtonDarkholme/yats.vim')
--Plug ('mhartington/nvim-typescript', {'do': './install.sh'})
--Plug ('Shougo/deoplete.nvim')
Plug ('Shougo/denite.nvim')
Plug('vim-airline/vim-airline')
Plug('tomasr/molokai')
Plug('igankevich/mesonic')

Plug('p00f/clangd_extensions.nvim')

Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')

--For vsnip users.
Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/vim-vsnip')
vim.call('call plug#end()')
