customPlugins: self: super: {
  ta = {
    vim = super.vim_configurable.customize {
      name = "vim";
      vimrcConfig = {
        pathogen = {
          knownPlugins = (customPlugins super) // super.vimPlugins;
          pluginNames = [
            "haskell-vim"
            "rainbow-vim"
            "vimwiki"
            "vim-sexp-mappings-for-regular-people"
            "vim-sexp"
            "vim-surround"
            "vim-repeat"
          ];
        };
        customRC = ''
          set colorcolumn=80
          set nocompatible
          filetype plugin on
          filetype indent on
          filetype on
          syntax on
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
          set tabstop=3 softtabstop=3 expandtab shiftwidth=3 smarttab
      
          autocmd BufNewFile,BufRead *.rkt set filetype=scheme
          autocmd FileType scheme :packadd vim-sexp
          autocmd FileType scheme :packadd vim-sexp-for-normies
          autocmd FileType scheme :packadd vim-surround
          autocmd FileType scheme :packadd vim-repeat
          autocmd FileType scheme :packadd paredit-vim
          autocmd FileType scheme :packadd vim-tslime
          autocmd FileType scheme :packadd racket-vim
      
          autocmd BufNewFile,BufRead *.hoon set filetype=hoon
          autocmd FileType hoon :packadd hoon-vim

          let g:rainbow_active = 1
          let g:rainbow_ctermfgs = [ 'lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
        '';
      };
    };
  };
}
