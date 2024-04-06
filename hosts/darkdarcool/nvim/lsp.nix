{ config, pkgs, inputs, ... }:

{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      denols.enable = true;
      rust-analyzer.enable = true;
      nil_ls.enable = true;
    };
  };
}
