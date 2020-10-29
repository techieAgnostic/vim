# tA's vim flake

this is a reproducible setup for my vim setup, including plugins and configuration.

## installation

requires a system capable of using nix flakes.

in order to try out temporarily:

```
nix shell github:techieAgnostic/vim --command vim
```

in order to add to an existing nix flakes configuration, simply add:

```
inputs.ta-vim.url = "github:techieAgnostic/vim";
```

which exposes the overlay `ta-vim.overlay` which can be added to your `nixpkgs.overlays`.

the overlay adds the package `ta.vim` which can be used as normal.

## adding plugins

plugins that exist in the nixpkg's repository can be added by name to the `vimrcConfig.pathogen.pluginNames` list in order to be loaded.

plugins that don't exist in nixpkgs can be added manually, in order to do so, first create an input for the git repository you wish to source from, for example, in order to add hoon highlighting:

```
inputs.hoon-vim-src = {
   url = "github:urbit/urbit";
   flake = false;
};
```

(make sure to add the new `hoon-vim-src` to the `outputs` function arguments.
then add the following to `customPlugins`:

```
hoon-vim = pkgs.vimUtils.buildVimPlugin {
   name = "hoon-vim";
   src = hoon-vim-src + "/extras/hoon.vim";
};
```

(the addition to the src path is for repos that contain a vim plugin among other things, and can be left off unless needed).

now, `hoon-vim` can be added to `vimrcConfig.pathogen.pluginNames` like any other plugin.
