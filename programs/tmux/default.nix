{ pkgs, ... }:

let
  nova = pkgs.tmuxPlugins.mkTmuxPlugin
    {
      pluginName = "nova";
      version = "unstable-2024-02-25";
      src = pkgs.fetchFromGitHub {
        owner = "o0th";
        repo = "tmux-nova";
        rev = "c827cd1d8fac4a86766d535a47d7174715d1b18c";
        sha256 = "sha256-qpviRordzZSqVzzK56rM1uHux7Ejfq2rxmTVCHfYV54=";
      };
    };
in
{
  home.packages = with pkgs;
    [
      tmux
      tmux-sessionizer
    ];

  home.file = {
    ".config/tms/config.toml".text = ''
      [[search_dirs]]
      path = '~/Projects'
      depth = 1
    '';

  };

  programs.tmux = {
    enable = true;
    shortcut = "a";
    aggressiveResize = true;
    baseIndex = 0;
    escapeTime = 0;
    terminal = "screen-256color";
    historyLimit = 50000;
    keyMode = "emacs";
    extraConfig = builtins.readFile ./tmux.conf;

    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.better-mouse-mode
      {
        plugin = nova;
        extraConfig = ''
          set -g @nova-nerdfonts true
          set -g @nova-nerdfonts-left 
          set -g @nova-nerdfonts-right 

          set -g @nova-pane-active-border-style "#76946A"
          set -g @nova-pane-border-style "#1F1F28"

          set -g @nova-status-style-bg "#16161D"
          set -g @nova-status-style-fg "#C8C093"

          set -g @nova-status-style-active-bg "#2D4F67"
          set -g @nova-status-style-active-fg "#C8C093"
          set -g @nova-status-style-double-bg "#C8C093"

          set -g @nova-pane "#I#{?pane_in_mode,  #{pane_mode},}  #W"
          set -g @nova-segment-whoami-colors "#43242B #C0A36E"

          set -g @nova-segment-mode "#{?client_prefix,Ω,ω}"
          set -g @nova-segment-mode-colors "#43242B #E6C384"

          set -g @nova-rows 0
          set -g @nova-segments-0-left "mode"
          set -g @nova-segments-0-right "whoami"
        '';
      }
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-boot 'on'
          set -g @continuum-save-interval '5'
        '';
      }
    ];
  };
}
