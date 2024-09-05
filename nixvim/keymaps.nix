{
  keymaps = [
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-W>h";
      options = {
        silent = true;
        desc = "Move to window left";
      };
    }

    {
      mode = "n";
      key = "<C-l>";
      action = "<C-W>l";
      options = {
        silent = true;
        desc = "Move to window right";
      };
    }

    {
      mode = "n";
      key = "<C-k>";
      action = "<C-W>k";
      options = {
        silent = true;
        desc = "Move to window over";
      };
    }

    {
      mode = "n";
      key = "<C-j>";
      action = "<C-W>j";
      options = {
        silent = true;
        desc = "Move to window bellow";
      };
    }

    {
      mode = "n";
      key = "<C-s>";
      action = "<cmd>w<cr><esc>";
      options = {
        silent = true;
        desc = "Save file";
      };
    }

    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Neotree toggle reveal_force_cwd<cr>";
      options = {
        silent = true;
        desc = "Explorer NeoTree (root dir)";
      };
    }
    {
      mode = "n";
      key = "<leader>E";
      action = "<cmd>Neotree toggle<CR>";
      options = {
        silent = true;
        desc = "Explorer NeoTree (cwd)";
      };
    }
    {
      mode = "n";
      key = "<leader>be";
      action = "<cmd>Neotree buffers<CR>";
      options = {
        silent = true;
        desc = "Buffer explorer";
      };
    }
    {
      mode = "n";
      key = "<leader>ge";
      action = "<cmd>Neotree git_status<CR>";
      options = {
        silent = true;
        desc = "Git explorer";
      };
    }
    {
      mode = "n";
      key = "<leader>`";
      action = "<cmd>b#<CR>";
      options = {
        silent = true;
        desc = "Switch to Other Buffer";
      };
    }
    {
      mode = "n";
      key = "s";
      action = "<cmd>lua require('flash').jump()<CR>";
      options = {
        silent = true;
        desc = "flash jump";
      };
    }
    {
      key = "S";
      mode = "n";
      action = "<cmd>lua require('flash').treesitter()<CR>";
      options = {
        silent = true;
        desc = "flash jump";
      };
    }
  ];
}
