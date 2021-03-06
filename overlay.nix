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

          nnoremap <Space> <Nop>
          let maplocalleader=" "

          if has("autocmd")
            au BufReadPost *.rkt,*.rktl set filetype=racket
            au filetype racket set lisp
            au filetype racket set autoindent
          endif
          
          autocmd FileType racket :packadd vim-sexp-for-regular-people
          autocmd FileType racket :packadd vim-sexp
          autocmd FileType racket :packadd vim-surround
          autocmd FileType racket :packadd vim-repeat
          autocmd FileType racket :packadd slimv
          autocmd FileType racket :packadd vim-racket

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
