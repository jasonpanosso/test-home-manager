{ ... }:

{
  programs.nixvim.indent-blankline = {
    enable = true;
    exclude = {
      buftypes = [ "terminal" "nofile" "prompt" ];
    };
  };
}
