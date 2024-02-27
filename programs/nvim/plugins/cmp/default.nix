{ pkgs, ... }:

{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      luasnip # TODO: refactor to load snippets like [this](https://git.sr.ht/~chiborg/nixvim-config/commit/dfc936d)
      cmp_luasnip
      cmp-nvim-lsp
      cmp-path
      cmp-buffer
      nvim-cmp
      lspkind-nvim
    ];

    keymaps = [
      {
        mode = [ "i" "s" ];
        key = "<C-L>";
        action = "<cmd>lua require('luasnip').jump(1)<CR>";
        options = {
          silent = true;
          desc = "Next snippet";
        };
      }

    ];

    extraConfigLua = builtins.readFile ./nvim-cmp.lua + builtins.readFile ./luasnip.lua;
  };
}
