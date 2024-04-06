{ config, pkgs, inputs, ... }:

{
  programs.nixvim.plugins.lualine = {
    enable = true;
    theme = "oxocarbon";
    sectionSeparators = {
      left = " ";
      right = " ";
    };
    
    disabledFiletypes.statusline = [
      "NvimTree"
    ];

    inactiveSections = {
      lualine_a = [{}];
      lualine_b = [{}];
      lualine_c = [{}];
      lualine_x = [{}];
      lualine_y = [{}];
      lualine_z = [{}];
    };
    sections = {
      lualine_a = [
	{
	  name = "mode";  
	  icon = "";
	  color = {
	    bg = "NONE";
	    fg = "#7b8496";
	  };
	}
      ];
      lualine_b = [
	{
	  name = "branch"; 
	  icon = "";
	}
      ];
      lualine_c = [
	{
	  name = "diagnostics"; 
	  extraConfig = {
	    symbols = {
	      error = " ";
              warn = " ";
              info = " ";
              hint = "󰝶 ";
	    };
	  };
	}
	{
	  name = "filetype"; 
	  separator = {
	    left = "";
	    right = "";
	  };
	  padding = {
	    left = 1;
	    right = 0;
	  };
	  extraConfig = {
	    icon_only = true;
	  };
	}
	{
	  name = "filename";
	  extraConfig = {
	    symbols = { 
	      modified = "  "; 
	      readonly = "";
	      unnamed = "";
	    };
	  };
	}
      ];
      lualine_x = [{}];
      lualine_y = [
	{
	  name = "progress";
	  color = {
	    fg = "#ff6e5e";
	    bg = "NONE";
	  };
	}
	{
	  name = "location";
	  color = {
	    fg = "#5ef1ff";
	    bg = "NONE";
	  };
	}
      ];
      lualine_z = [{}];
    }; 
  };
}
