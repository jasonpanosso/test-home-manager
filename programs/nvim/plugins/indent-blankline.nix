{ ... }:

{
  programs.nixvim.plugins.indent-blankline = {
    enable = true;
    exclude = {
      buftypes = [ "terminal" "nofile" "prompt" ];
    };
  };
}
