{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    autocd = true;
    syntaxHighlighting = {
      enable = true;
    };

    shellAliases = {
      sl = "eza";
      ls = "eza";
      l = "eza -l";
      la = "eza -la";
      ip = "ip --color=auto";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "gitfast"
        "rbw"
        "jsontools"
      ];
    };

    initExtra = ''
      bindkey "''${key[Up]}" up-line-or-search
    '';

    plugins = [
      {
        name = "spaceship";
        src = pkgs.spaceship-prompt;
        file = "share/zsh/themes/spaceship.zsh-theme";
      }
    ];
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
