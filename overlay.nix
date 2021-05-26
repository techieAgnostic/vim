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
            "idris2"
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
