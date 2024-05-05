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

    };
    onAttach = ''
      if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
	vim.lsp.inlay_hint.enable(bufnr, true)
      end
    '';
  };
}
