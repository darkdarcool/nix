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
		pavucontrol
		bluez
	];
	environment.etc = {
	"wireplumber/bluetooth.lua.d/51-bluez-config.lua".text = ''
		bluez_monitor.properties = {
			["bluez5.enable-sbc-xq"] = true,
			["bluez5.enable-msbc"] = true,
			["bluez5.enable-hw-volume"] = true,
			["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
		}
	'';
	};
}
