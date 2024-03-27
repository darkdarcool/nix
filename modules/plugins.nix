{ config, pkgs, inputs, ... }:
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
			yazi
			# bun 
			inputs.unstable.legacyPackages."${pkgs.system}".bun	
			inputs.unstable.legacyPackages."${pkgs.system}".deno
			lunar-client
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
		];
	};

}
