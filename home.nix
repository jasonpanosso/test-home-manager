{ pkgs, ... }:

{
  imports = [
    ./programs/shell.nix
    ./programs/tmux.nix
    ./programs/kitty.nix
    ./programs/nvim
  ];

  home.username = "jason";
  home.homeDirectory = "/home/jason";

  home.stateVersion = "23.11";

  home.packages = with pkgs;[
    btop # htop/nmon
    calibre
    discord
    dnsutils # `dig` command
    docker-compose
    ethtool # query/control network device driver & hw settings
    eza # improved ls
    fd # improved find
    file # determines type of a file(human readable/mime)
    fzf # fuzzy find
    glow # md viewer
    gnupg # privary guard
    gnused # sed
    gnutar # tar
    iftop # net
    iotop # io
    ipcalc # calculates broadcast/network/host range/etc from ip & netmask
    iperf3 # network perf tool
    jq
    killall
    ldns # dns lookup tool - `drill` command
    lm_sensors # for `sensors` command
    lsof # list open files
    ltrace # lib calls
    mtr # my traceroute (auto refreshing traceroute)
    nmap # network mapper
    p7zip # 7-zip port for unix
    pciutils # lspci
    redshift # adaptive brightness
    ripgrep
    strace # sys calls
    sysstat # sys perf monitoring tools
    tree
    unzip
    usbutils # lsusb
    which
    xz # xz compression
    yq-go # jq for yaml
    zip

    (with dotnetCorePackages; combinePackages [
      sdk_6_0
      sdk_7_0
      sdk_8_0
      runtime_6_0
      runtime_7_0
      runtime_8_0
    ])

    (nerdfonts.override {
      fonts = [
        "IosevkaTerm"
        "IosevkaTermSlab"
        "Iosevka"
      ];
    })
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
    WINEESYNC = 1;
    PATH = ''
      $HOME/.cargo/bin:\
      $HOME/.local/bin:\
      /usr/local/sbin:\
      /usr/local/bin:\
      /usr/sbin:\
      /usr/bin:\
      /sbin:\
      /bin:\
      /snap/bin:\
      /usr/local/go:\
      /usr/local/go/bin:\
    '';
  };

  programs.home-manager.enable = true;
}
