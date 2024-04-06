{ config, pkgs, inputs, ... }:

{
  programs.nixvim.plugins.presence-nvim = {
    enable = true;

    neovimImageText = "nvim and nixvim sucks btw";
    debounceTimeout = 10;
    editingText = "Editing %s";
    workspaceText = "Working on %s";
    autoUpdate = true;
    mainImage = "file";
  };
}
