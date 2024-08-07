{ config, pkgs, inputs, ... }:

{
  programs.nixvim.plugins.lualine = {
    enable = true;

    sectionSeparators = {
      left = "|";
      right = "|";
    };

    componentSeparators = {
      left = "|";
      right = "|";
    };

    disabledFiletypes.statusline = [ "NvimTree" ];

    ignoreFocus = [ "NvimTree" ];

    inactiveSections = {
      lualine_a = [ { } ];
      lualine_b = [ { } ];
      lualine_c = [ { } ];
      lualine_x = [ { } ];
      lualine_y = [ { } ];
      lualine_z = [ { } ];
    };

    sections = {
      lualine_a = [{
        name = "mode";

        separator = {
          left = "";
          right = "|";
        };
      }];

      lualine_b = [
        {
          name = "filetype";
          separator = {
            left = "|";
            right = "";
          };
          padding = {
            left = 1;
            right = 0;
          };
          extraConfig = { icon_only = true; };
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

          padding = {
            left = 0;
            right = 1;
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

            sources = [ "nvim_workspace_diagnostic" ];

            update_in_insert = true;
            always_visible = true;
          };
        }
        {
          name = "navic";

          extraConfig = {
            color_correction = "dynamic";
            navic_opts = null;

            seperator = {
              left = "|";
              right = "";
            };
          };
        }
      ];

      lualine_x = [
        {
          name = "copilot";
          fmt = # lua
            ''
              function(text)
                -- add seperator bc lualine's dogshit 
                return text --.. " |"
              end
            '';
        }
        # Shitty lil' hack to get cwd in the statusline
        {
          name = "filename";
          fmt = # lua
            ''
              function(text)    
                -- all content after the last '/'    
                local cwd = vim.fn.getcwd()    
                local cwd = cwd:match(".*/(.*)")
                local cwd = " " .. cwd
                return cwd 
              end
            '';
        }
      ];

      lualine_y = [{
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
      }];

      lualine_z = [{
        name = "progress";
        color = {
          fg = "#ff6e5e";
          bg = "NONE";
        };
      }];
    };
  };
}
