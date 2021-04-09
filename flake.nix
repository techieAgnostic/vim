{
  description = "tA's vim setup";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    rainbow-vim-src = {
      url = "github:junegunn/rainbow_parentheses.vim";
      flake = false;
    };
    vim-racket-src = {
      url = "github:wlangstroth/vim-racket";
      flake = false;
    };
    slimv-src = {
      url = "github:kovisoft/slimv";
      flake = false;
    };
  };
  outputs = { self, nixpkgs, flake-utils, rainbow-vim-src
            , vim-racket-src, slimv-src, ... }: 
  let
    customPlugins = pkgs: {
      rainbow-vim = pkgs.vimUtils.buildVimPlugin {
        name = "rainbow-vim";
        src = rainbow-vim-src;
      };
      vim-racket = pkgs.vimUtils.buildVimPlugin {
        name = "vim-racket";
        src = vim-racket-src;
      };
      slimv = pkgs.vimUtils.buildVimPlugin {
        name = "slimv";
        src = slimv-src;
      };
    };
  in flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        overlays = [ ((import ./overlay.nix) customPlugins) ];
        inherit system;
      };
    in {
      defaultPackage = pkgs.ta.vim;
    }) // { 
      overlay = (import ./overlay.nix) customPlugins;
    };
}
