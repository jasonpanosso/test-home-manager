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

    extraConfigLua = builtins.readFile ./nvim-cmp.lua + builtins.readFile ./luasnip.lua;
  };
}
