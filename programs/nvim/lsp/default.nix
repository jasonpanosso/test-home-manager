{ ... }:

{
  programs.nixvim.plugins.lsp = {
    enable = true;
  };

  imports = [
    ./inlayhints
  ];
}
