{
  plugins.telescope = {
    enable = true;
    enabledExtensions = [];
    extensions = {
      ui-select.enable = true;
      frecency = {
        enable = false;
        settings = {
          showUnindexed = true;
          show_scores = true;
          defaultWorkspace = "CWD";
        };
      };
      fzf-native.enable = true;
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>fg";
      action = "<cmd>Telescope live_grep<cr>";
      options = {
        silent = true;
        desc = "live_grep";
      };
    }
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>Telescope fd<cr>";
      options = {
        silent = true;
        desc = "fd";
      };
    }
    {
      mode = "n";
      key = "<leader><leader>";
      action = "<cmd>Telescope frecency workspace=CWD path_display={'shorten'} theme=dropdown<cr>";
      options = {
        silent = true;
        desc = "frecency";
      };
    }
    {
      mode = "n";
      key = "<C-w>";
      action = "<cmd>lua require('telescope.builtin').live_grep({ default_text = vim.fn.expand('<cword>') })<CR>";
      options = {
        silent = true;
        desc = "live_grep current word";
      };
    }
  ];
}
