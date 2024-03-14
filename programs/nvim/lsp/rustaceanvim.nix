{
  programs.nixvim.plugins.rustaceanvim = {
    enable = true;

    server = {
      onAttach =
        #lua
        ''
          function(client, bufnr)
            require('lsp-inlayhints').on_attach(client, bufnr)

            vim.keymap.set('n', '<Leader>rd', function()
              vim.cmd.RustLsp('debuggables')
            end, { buffer = bufnr, silent = true })

            vim.keymap.set('n', '<Leader>ca', function()
              vim.cmd.RustLsp('codeAction')
            end, { buffer = bufnr, silent = true })

            # https://www.reddit.com/r/neovim/comments/12gvms4/this_is_why_your_higlights_look_different_in_90/
            vim.api.nvim_set_hl(0, '@lsp.type.macro', { link = 'Macro', default = true })
            vim.api.nvim_set_hl(0, '@lsp.type.decorator', { link = '@function', default = true })
          end
        '';

      settings = {
        cargo = {
          features = "all";
        };

        checkOnSave = true;
        check.command = "clippy";
      };
    };
  };
}
