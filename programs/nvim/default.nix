{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins/neodev.nix
    ./lsp
    ./plugins/colorscheme
    ./plugins/alpha.nix
    ./plugins/lualine
    ./plugins/gitsigns.nix
    ./plugins/oil.nix
    ./plugins/auto-hlsearch.nix
    ./plugins/colorizer.nix
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
