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
            "vim-sexp-mappings-for-regular-people"
            "vim-sexp"
            "vim-surround"
            "vim-repeat"
          ];
        };
        customRC = ''
          set nocompatible
          
          filetype on
          filetype plugin on
          filetype indent on

          syntax on
          colorscheme delek

          if has("autocmd")
            au BufReadPost *.rkt,*.rktl set filetype=racket
            au filetype racket set lisp
            au filetype racket set scheme
            au filetype racket set autoindent
          endif
          
          autocmd BufNewFile,BufRead *.rkt set filetype=scheme
          autocmd FileType scheme :packadd vim-sexp
          autocmd FileType scheme :packadd vim-sexp-for-regular-people
          autocmd FileType scheme :packadd vim-surround
          autocmd FileType scheme :packadd vim-repeat
          autocmd FileType scheme :packadd slimv
          autocmd FileType scheme :packadd vim-racket

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

          let g:rainbow_active = 1
      
          imap <C-L> λ

          let g:rainbow_conf = {
           \ 'ctermfgs': ['red', 'green', 'blue', 'cyan', 'magenta'],
           \ 'cterms': ['bold']
           \}


        '';
      };
    };
  };
}
