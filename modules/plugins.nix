{ config, pkgs, inputs, ... }:
{
  users.users.darkdarcool = {
    isNormalUser = true;
    description = "darkdarcool";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.nushell;

    packages = with pkgs; [
      phinger-cursors
      cpio
      meson
      cmake
      zed-editor
      gimp 
      vencord
      vesktop
      swww
      nil
      firefox
      kitty
      wl-clipboard
      copyq
      yazi
      # bun 
      inputs.unstable.legacyPackages."${pkgs.system}".bun
      inputs.unstable.legacyPackages."${pkgs.system}".deno
      inputs.unstable.legacyPackages."${pkgs.system}".hyprlock
      inputs.unstable.legacyPackages."${pkgs.system}".hyprcursor
      inputs.unstable.legacyPackages."${pkgs.system}".vimPlugins.base16-nvim
      # inputs.unstable.legacyPackages."${pkgs.system}".neovim
      rose-pine-gtk-theme
      rose-pine-icon-theme
      firefoxpwa
      carapace
      lunar-client
      rustup
      nushell
      neofetch
      shotman
      grim
      slurp
      vscode
      gh
      cloudflared
      greetd.tuigreet
      wofi
      bat
      eza
      alacritty
      starship
      spotify
      unzip
      zls
      zoxide
      fzf
      pkg-config
      playerctl
      wttrbar
      wlsunset
      swaynotificationcenter
      mako
      cli-visualizer
      cbonsai
      steamPackages.steamcmd
      steam-tui
      xfce.thunar
      xfce.ristretto
      openssl
      libiconv
    ];
  };

}
