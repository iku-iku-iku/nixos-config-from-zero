{
  config,
  lib,
  pkgs,
  ...
}: {
  globals.mapleader = " ";
  extraConfigLua = ''
  '';

  imports = [
    ./keymaps.nix
    ./settings.nix
    ./plugins/conform.nix
    ./plugins/flash.nix
    ./plugins/lightline.nix
    ./plugins/neo-tree.nix
    ./plugins/which-key.nix
    ./plugins/toggleterm.nix
    ./plugins/telescope.nix
  ];
  enable = true;
  defaultEditor = true;
  extraPlugins = [pkgs.vimPlugins.gruvbox];
  colorschemes.gruvbox.enable = true;
}
