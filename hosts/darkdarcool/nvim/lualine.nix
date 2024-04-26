{ config, pkgs, inputs, ... }:

{
  programs.nixvim.plugins.lualine = {
    enable = true;
    # theme = "oxocarbon";
    #sectionSeparators = {
    #  left = " ";
    #  right = " ";
    #};

    disabledFiletypes.statusline = [
      "NvimTree"
    ];

    inactiveSections = {
      lualine_a = [{ }];
      lualine_b = [{ }];
      lualine_c = [{ }];
      lualine_x = [{ }];
      lualine_y = [{ }];
      lualine_z = [{ }];
    };
    sections = {
      lualine_a = [
        {
          name = "branch";
          icon = "";
          color = {
            bg = "NONE";
            fg = "#7b8496";
          };
        }
      ];
      lualine_b = [
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
          # icon = "";
	  extraConfig = {
	    symbols = {
	      modified = "  ";
	      readonly = "";
	      unnamed = "";
	    };
	  };
	  separator = {
	    left = null;
	    right = "|";
	  };
        }
      ];
      lualine_c = [
        {
          name = "diagnostics";
          extraConfig = {
            symbols = {
              # error = " ";
	      error = " ";
              # warn = " ";
	      warn = " ";
              # info = " ";
	      info = " ";
              # hint = "󰝶 ";
	      hint = "󰛿 ";
            };
          };
        }
      ];
      lualine_x = [
	# Shitty lil' hack to get cwd in the statusline
	{
	  name = "filename";
	  fmt = ''
	    function(text)
	      -- all content after the last '/'
	      local cwd = vim.fn.getcwd()
	      local cwd = cwd:match(".*/(.*)")
	      local cwd = " " .. cwd
	      return cwd
	    end
	  '';
	  separator = {
	    left = "";
	    right = "|";
	  };
	}
      ];
      lualine_y = [
	{
	  name = "diff";
	  extraConfig = {
	    color = {
	      added = "#08bab7";
	      modified = "#f9c859";
	      removed = "#ec5295";
	    };
	    symbols = {
	      # added = " ";
	      added = " ";
	      # modified = " ";
	      # Nerd fonts - you guys are fucking shit for not having a dot :sob: 
	      modified = " ";
	      # removed = " ";
	      removed = " ";
	    };
	  };
	  separator = {
	    left = "";
	    right = "|";
	  };
	}
      ];
      lualine_z = [
	{
	  name = "progress";
	  color = {
	    fg = "#ff6e5e";
	    bg = "NONE";
	  };
	}
      ];
    };
  };
}
