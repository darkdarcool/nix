{ config, pkgs, inputs, ... }: 

{
  programs.nixvim.plugins.auto-save = {
    enable = true;
    triggerEvents = [ "InsertLeave" "TextChanged" ];
    extraOptions = {
      execution_message = {
	enabled = false;
      };
    };
  };
}
