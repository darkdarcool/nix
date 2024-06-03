{ config, pkgs, inputs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      cursor = {
	blink_interval = 500;
	thickness = 0.15;
	unfocused_hollow = true;

	style = {
	  blinking = "Always";	  
	  shape = "Beam";
	};
      };

      font = {
	size = 9.5;
	normal = {
	  family = "MesloLGSDZ Nerd Font Mono";
	  style = "Regular";
	};
      };

      shell = {
	program = "tmux";
      };

      window = {
	opacity = 1;
	padding = {
	  x = 0;
	  y = 0;
	};
      };
      
      # TODO: Inline this in a style
      colors = {
	bright = {
	  black = "#393939";
	  blue = "#33b1ff";
	  cyan = "#3ddbd9";
	  green = "#42be65";
	  magenta = "#ff7eb6";
	  red = "#ee5396";
	  white = "#ffffff";
	  yellow = "#ffe97b";
	};
	normal = {
	  black = "#262626";
	  blue = "#33b1ff";
	  cyan = "#3ddbd9";
	  green = "#42be65";
	  magenta = "#ff7eb6";
	  red = "#ee5396";
	  white = "#dde1e6";
	  yellow = "#ffe97b";
	};
	primary = {
	  background = "#121212";
	  foreground = "#ffffff";
	};

	search.matches = {
	  background = "#ee5396";
	  foreground = "CellBackground";
	};
      };
    };
  };
}
