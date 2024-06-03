{ config, pkgs, inputs, lib, ... }:

let
  kvOps = {
    listsAsDuplicateKeys = true;
  };
in
{
  home.file."${config.xdg.configHome}/ghostty/config" = {
    text = lib.generators.toKeyValue kvOps {
      background = "#161616";
      foreground = "#ffffff";
      window-decoration = false;
      clipboard-paste-protection = false;
      confirm-close-surface = false;
      window-padding-x = 0;
      window-padding-y = 0;
      font-family = "MesloLGSDZ Nerd Font";
      font-size = 9;
      font-feature = [
        "-calt"
        "-liga"
      ];
      font-thicken = true;
      cursor-style = "bar";
      cursor-style-blink = true;
      palette = [
        # black
        "0=#262626"
        "8=#262626"
        # red
        "1=#ee5396"
        "9=#ee5396"
        # green
        "2=#42be65"
        "10=#42be65"
        # yellow
        "3=#ffe87b"
        "11=#ffe87b"
        # blue
        "4=#33b1ff"
        "12=#33b1ff"
        # purple
        "5=#ff7eb6"
        "13=#ff7eb6"
        # aqua
        "6=#3ddbd9"
        "14=#3ddbd9"
        # white
        "7=#dde1e6"
        "15=#dde1e6"
      ];
      selection-background = "#ee5396";
    };
  };
}
