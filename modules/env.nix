{ config, pkgs, ... }:

{
	environment.sessionVariables.NIXOS_OZONE_WL = "1";
	environment.sessionVariables.XCURSOR_SIZE = "32";
	environment.systemPackages = with pkgs; [
		waybar
		rofi-wayland
		wtype
		hyprpaper
		discord
		neovim
		git     
		cloudflare-warp
		gnome3.adwaita-icon-theme
		networkmanagerapplet
		libgcc
		zig_0_10
		tree-sitter
		nodejs_21
		obsidian
		python311
		ripgrep
		gccgo13
		brightnessctl
		openssl
	];
}
