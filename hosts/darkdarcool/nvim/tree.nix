{ config, pkgs, inputs, ... }:

{
  programs.nixvim.plugins.nvim-tree = {
    enable = true;

    filters = {
      custom = [
        "node_modules"
        "target"
        "result"
        ".git/"
      ];
      dotfiles = true;
    };

    openOnSetup = true;
  };
}
