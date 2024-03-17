{ config, pkgs, ...  }:

{
	services.greetd = {
		enable = true;
		settings = {
			default_session = {
				command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
				user = "darkdarcool";
			};
		};
	};

	programs.tmux = {
		enable = true;
		clock24 = true;
		extraConfig = '' # used for less common options, intelligently combines if defined in multiple places.

			'';
	};

	xdg.portal.enable = true;

	programs.hyprland.enable = true;
  programs.light.enable = true; 
 # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };
  services.blueman.enable = true;
  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "darkdarcool" ];
  };

}
