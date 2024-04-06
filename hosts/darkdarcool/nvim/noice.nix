{ config, pkgs, inputs, ... }: 

{
  programs.nixvim.plugins.noice = {
    enable = true;
    views = {
      mini = {
	win_options = {
	  winblend = 0;
	};
      };
    };
  };
}
