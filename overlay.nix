customPlugins: self: super: {
  ta = {
    vim = super.vim_configurable.customize {
      name = "vim";
      vimrcConfig = {
        pathogen = {
          knownPlugins = super.vimPlugins // (customPlugins super);
          pluginNames = [
            "vim-racket"
            "haskell-vim"
            "rainbow-vim"
            "vimwiki"
            "vim-sexp-mappings-for-regular-people"
            "vim-sexp"
            "vim-surround"
            "vim-repeat"
            "slimv"
          ];
        };
        customRC = ''
          set nocompatible
          
          filetype on
          filetype plugin on
          filetype indent on

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
          set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab
      
          autocmd BufNewFile,BufRead *.rkt set filetype=scheme
          autocmd FileType scheme :packadd vim-sexp
          autocmd FileType scheme :packadd vim-sexp-for-regular-people
          autocmd FileType scheme :packadd vim-surround
          autocmd FileType scheme :packadd vim-repeat
          autocmd FileType scheme :packadd slimv
          autocmd FileType scheme :packadd vim-racket
      
          autocmd BufNewFile,BufRead *.hoon set filetype=hoon
          autocmd FileType hoon :packadd hoon-vim

          let g:rainbow_active = 1
          let g:rainbow_ctermfgs = [ 'lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
        '';
      };
    };
  };
}
