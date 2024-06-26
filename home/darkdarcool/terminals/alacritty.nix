{ config, pkgs, inputs, theme, ... }:

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
          family = theme.fonts.serif; # "MesloLGSDZ Nerd Font Mono";
          style = "Regular";
        };
      };

      shell = { program = "tmux"; };

      window = {
        opacity = 1;
        padding = {
          x = 0;
          y = 0;
        };
      };

      colors = {
        bright = {
          black = theme.colors.withHashtag.base02;
          blue = theme.colors.withHashtag.base09;
          cyan = theme.colors.withHashtag.base08;
          green = theme.colors.withHashtag.base0D;
          magenta = theme.colors.withHashtag.base0C;
          red = theme.colors.withHashtag.base0A;
          white = theme.colors.withHashtag.base06;
          # Our theme doesn't have a yellow
          yellow = "#ffe97b";
        };
        normal = {
          black = theme.colors.withHashtag.base01;
          blue = theme.colors.withHashtag.base09;
          cyan = theme.colors.withHashtag.base08;
          green = theme.colors.withHashtag.base0D;
          magenta = theme.colors.withHashtag.base0C;
          red = theme.colors.withHashtag.base0A;
          white = theme.colors.withHashtag.base05;
          # Our theme doesn't have a yellow
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
