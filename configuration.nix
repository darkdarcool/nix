# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:


{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/plugins.nix
      ./modules/programs.nix
      ./modules/system.nix
      ./modules/env.nix
    ];

  # Sudo
  security.sudo.extraRules = [
    {
      users = [ "darkdarcool" ];
      commands = [
        {
          command = "ALL";
          options = [ "NOPASSWD" "SETENV" ]; # "SETENV" # Adding the following could be a good idea
        }
      ];
    }
  ];

  # If you hate yourself
  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "unstable"; #"23.11"; # Did you read the comment?

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    sf-mono-liga-bin
  ];

  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
    };
  };
}
