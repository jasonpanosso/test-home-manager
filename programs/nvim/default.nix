{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.nixvim = {
    enable = true;
    viAlias = true;
    package = pkgs.neovim-nightly;
  };
}
