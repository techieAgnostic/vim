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
      url = "github:frazrepo/vim-rainbow";
      flake = false;
    };
  };
  outputs = { self, nixpkgs, flake-utils, rainbow-vim-src, ... }: 
  let
    customPlugins = pkgs: {
      rainbow-vim = pkgs.vimUtils.buildVimPlugin {
        name = "rainbow-vim";
        src = rainbow-vim-src;
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
