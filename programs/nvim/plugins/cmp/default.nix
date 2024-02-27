{ pkgs, ... }:

{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      cmp_luasnip
      cmp-nvim-lsp
      cmp-path
      cmp-buffer
      nvim-cmp
      lspkind-nvim
    ];

    plugins.friendly-snippets.enable = true;
    plugins.luasnip = {
      enable = true;

      fromVscode = [
        {
          paths = ./snippets;
        }
      ];

      extraConfig = {
        enable_autosnippets = true;
        updateevents = "TextChanged,TextChangedI";

        ext_opts = {
          __raw = ''
            {
              [require('luasnip.util.types').choiceNode] = {
                active = {
                  virt_text = { { '<- choiceNode', 'Comment' } },
                },
              },
            }
          '';
        };
      };
    };

    keymaps = [
      {
        mode = [ "i" "s" ];
        key = "<C-L>";
        action = "function() require('luasnip').jump(1) end";
        lua = true;
        options = {
          silent = true;
          desc = "Next snippet";
        };
      }
    ];

    extraConfigLua = builtins.readFile ./nvim-cmp.lua;
  };
}
