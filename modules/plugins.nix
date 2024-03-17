{ config, pkgs, ... }:
{
	users.users.darkdarcool = {
		isNormalUser = true;
		description = "darkdarcool";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [
			firefox
			kitty
			wl-clipboard
			copyq
			bun
			deno
			rustup
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
		];
	};

}
