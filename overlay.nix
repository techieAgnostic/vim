customPlugins: self: super: {
  ta = {
    vim = super.vim_configurable.customize {
      name = "vim";
      vimrcConfig = {
        pathogen = {
          knownPlugins = super.vimPlugins // (customPlugins super);
          pluginNames = [
            "rainbow-vim"
            "vimwiki"
            "slimv"
            "vim-racket"
          ];
        };
        customRC = ''
          set nocompatible
          
          filetype on
          filetype plugin on
          filetype indent on


          if has("autocmd")
            au BufReadPost *.rkt,*.rktl set filetype=racket
            au filetype racket set lisp
            au filetype racket set autoindent
          endif
          
          set encoding=utf-8
          
          set autoindent
          set smartindent
          
          set ignorecase
          set smartcase
          set hlsearch
          set history=100
          
          set number
          set wildmenu
          
          set backspace=eol,indent,start
          set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab

          au VimEnter * RainbowParenthesesToggle
          au Syntax * RainbowParenthesesLoadRound
          au Syntax * RainbowParenthesesLoadSquare
          au Syntax * RainbowParenthesesLoadBraces

          let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['black',       'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
      
          imap <C-L> λ
          syntax on
          colorscheme default

        '';
      };
    };
  };
}
