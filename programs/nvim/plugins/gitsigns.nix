{
  programs.nixvim.plugins.gitsigns = {
    enable = true;
    currentLineBlame = true;
    signcolumn = true;
    signs = {
      changedelete = {
        hl = "GitSignsChange";
        text = "▎";
        numhl = "GitSignsChangeNr";
        linehl = "GitSignsChangeLn";
      };
    };
  };
}
