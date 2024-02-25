{ pkgs, ... }:

{
  imports = [
    ./shell.nix
    ./programs/tmux
    ./programs/kitty.nix
  ];

  home.username = "jason";
  home.homeDirectory = "/home/jason";

  home.stateVersion = "23.11";

  home.packages = with pkgs;[
    # archives
    zip
    xz
    unzip
    p7zip
    gnutar

    # utils
    ripgrep
    jq
    yq-go
    fzf
    eza

    # net tools
    mtr
    iperf3
    dnsutils
    ldns
    nmap
    ipcalc

    # misc
    file
    which
    tree
    gnused
    gnupg

    # productivity
    glow

    # monitoring
    strace # sys calls
    ltrace # lib calls
    lsof # list open files
    btop # htop/nmon
    iotop # io
    iftop # net

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb

    (nerdfonts.override {
      fonts = [
        "IosevkaTerm"
        "IosevkaTermSlab"
        "Iosevka"
      ];
    })

    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  home.file = {
    ".config/gammyconf".text = ''
      {
          "brt_auto": true,
          "brt_extend": false,
          "brt_fps": 60,
          "brt_max": 500,
          "brt_min": 250,
          "brt_offset": 166,
          "brt_polling_rate": 100,
          "brt_speed": 1000,
          "brt_step": 500,
          "brt_threshold": 8,
          "log_level": 3,
          "temp_auto": false,
          "temp_fps": 45,
          "temp_high": 6500,
          "temp_low": 3400,
          "temp_speed": 60.0,
          "temp_step": 0,
          "temp_sunrise": "06:00:00",
          "temp_sunset": "16:00:00",
          "wnd_show_on_startup": false,
          "wnd_x": 2880,
          "wnd_y": 0
      }
    '';
  };

  home.sessionVariables = {
    DOTNET_ROOT = "/usr/lib/dotnet";
    TERMINAL = "/usr/bin/kitty";
    VISUAL = "nvim";
    EDITOR = "$VISUAL";
    WINEESYNC = 1;

    PATH =
      "$HOME/.cargo/bin:$HOME/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:$HOME/.dotnet/tools:$HOME/.tmux/plugins/tmux-open-nvim/scripts:$HOME/.local/share/bob/nvim-bin:$HOME/.local/share/pnpm:$HOME/.jenv/bin:$HOME/.local/share/coursier/bin:/usr/local/go:/usr/local/go/bin:/nix/var/nix/profiles/default/bin";
  };

  programs.home-manager.enable = true;
}
