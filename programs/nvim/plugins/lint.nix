{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nodePackages_latest.eslint_d
    selene
    python311Packages.flake8
    sqlfluff
    ansible-lint
    djlint
  ];

  programs.nixvim.plugins.lint = {
    enable = true;
    autoCmd.event = [ "InsertLeave" "TextChanged" "BufRead" ];
    lintersByFt = {
      python = [ "flake8" ];
      lua = [ "selene" ];
      luau = [ "selene" ];
      sql = [ "sqlfluff" ];
      yml = [ "ansible_lint" ];
      yaml = [ "ansible_lint" ];
      htmldjango = [ "djlint" ];
    };
  };
}
