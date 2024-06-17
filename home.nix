{ config, pkgs, inputs, theme, ... }:

{
  imports = [
    ./hosts/darkdarcool/nvim.nix
    ./hosts/darkdarcool/desktop.nix
    ./hosts/darkdarcool/wayland
    ./hosts/darkdarcool/terminals
    #  ./hosts/darkdarcool/firefox.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "darkdarcool";
  home.homeDirectory = "/home/darkdarcool";

  home.stateVersion = "23.11"; # Please read the comment before changing.
  home.packages = [ ];

  home.file = { };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.bat = {
    config.theme = "base16";
    themes.base16.src = pkgs.writeText "base16.oxocarbon" theme.colors;
  };
}
