{ ... }:

{
  programs.nixvim.plugins.lsp = {
    enable = true;
  };

  imports = [
    ./inlayhints
    ./lspsaga
  ];

  programs.nixvim.keymaps = [
    {
      mode = [ "n" ];
      key = "<leader>li";
      action = "<cmd>LspInfo<CR>";
      options = {
        silent = true;
        desc = "[L]SP [I]nfo";
      };
    }

    {
      mode = [ "n" "v" ];
      key = "<leader>lr";
      action = "<cmd>LspStop<CR><cmd>sleep 100m<CR><cmd>LspStart<CR>";
      options = {
        desc = "[L]sp [R]estart";
      };
    }

    {
      mode = [ "n" ];
      key = "<leader>k";
      action = "<cmd>lua vim.lsp.buf.signature_help()<CR>";
      options = {
        silent = true;
        desc = "LSP: Signature Help";
      };
    }
  ];
}
