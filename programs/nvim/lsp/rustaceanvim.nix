{
  programs.nixvim.plugins.rustaceanvim = {
    enable = true;

    server = {
      onAttach =
        #lua
        ''
          function()
            vim.keymap.set('n', '<Leader>rd', function()
              vim.cmd.RustLsp('debuggables')
            end, { buffer = bufnr, silent = true })

            vim.keymap.set('n', '<Leader>ca', function()
              vim.cmd.RustLsp('codeAction')
            end, { buffer = bufnr, silent = true })

            -- require('lsp-inlayhints').on_attach(client, bufnr)
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