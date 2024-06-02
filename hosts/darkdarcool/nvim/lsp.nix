{ config, pkgs, inputs, ... }:

{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      denols.enable = true;
      rust-analyzer.enable = true;
      # nil_ls.enable = true;
      zls = {
        enable = true;
        package = inputs.zls.packages."${pkgs.system}".zls;
      };

      gleam.enable = true;
    };
    onAttach = ''
            require("inlay-hints").on_attach(client, bufnr) 
            require("lsp_signature").on_attach({ 
      	bind = true,
      	handler_opts = {
      	  border = "rounded"
      	}
            }, bufnr)
    '';
  };
}
