{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./lsp
    ./plugins
    ./general-keymaps.nix
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
