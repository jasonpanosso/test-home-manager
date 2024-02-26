{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./lsp
    ./plugins/neodev.nix
    ./plugins/colorscheme
    ./plugins/alpha.nix
    ./plugins/lualine
    ./plugins/gitsigns.nix
    ./plugins/oil.nix
    ./plugins/auto-hlsearch.nix
    ./plugins/colorizer.nix
    ./plugins/undotree.nix
    ./plugins/tmux-navigator.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.nixvim = {
    enable = true;
    viAlias = true;
    package = pkgs.neovim-nightly;
    globals.mapleader = " ";
  };
}
