{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./keymaps.nix
    ./settings.nix
  ];
  enable = true;
  defaultEditor = true;
  extraPlugins = [pkgs.vimPlugins.gruvbox];
  globals.mapleader = " "; # Sets the leader key to space
  colorschemes.gruvbox.enable = true;
  plugins.lightline.enable = true;
  plugins.neo-tree = {
    enable = true;
    enableDiagnostics = true;
    enableGitStatus = true;
    enableModifiedMarkers = true;
    enableRefreshOnWrite = true;
    closeIfLastWindow = true;
    popupBorderStyle = "rounded"; # Type: null or one of “NC”, “double”, “none”, “rounded”, “shadow”, “single”, “solid” or raw lua code
    buffers = {
      bindToCwd = false;
      followCurrentFile = {
        enabled = true;
      };
    };
    window = {
      width = 40;
      height = 15;
      autoExpandWidth = false;
      mappings = {
        "<space>" = "none";
      };
    };
  };
  plugins.conform-nvim = {
    enable = true;
    formatOnSave = {
      lspFallback = true;
      timeoutMs = 500;
    };
    notifyOnError = true;
    formattersByFt = {
      liquidsoap = ["liquidsoap-prettier"];
      html = [
        [
          "prettierd"
          "prettier"
        ]
      ];
      css = [
        [
          "prettierd"
          "prettier"
        ]
      ];
      javascript = [
        [
          "prettierd"
          "prettier"
        ]
      ];
      javascriptreact = [
        [
          "prettierd"
          "prettier"
        ]
      ];
      typescript = [
        [
          "prettierd"
          "prettier"
        ]
      ];
      typescriptreact = [
        [
          "prettierd"
          "prettier"
        ]
      ];
      python = ["black"];
      lua = ["stylua"];
      nix = ["alejandra"];
      markdown = [
        [
          "prettierd"
          "prettier"
        ]
      ];
      yaml = [
        "yamllint"
        "yamlfmt"
      ];
    };
  };
}
