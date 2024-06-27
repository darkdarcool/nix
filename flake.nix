{
  description = "My shitty system config";

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    sf-mono-liga-src = {
      url = "github:shaunsingh/SFMono-Nerd-Font-Ligaturized";
      flake = false;
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zls = {
      url = "github:zigtools/zls";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zig.url = "github:mitchellh/zig-overlay";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    # Color utils
    nix-colors.url = "github:misterio77/nix-colors";
    nur.url = "github:nix-community/NUR";
    ghostty = { url = "git+ssh://git@github.com/ghostty-org/ghostty"; };
    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    howdy.url = "github:fufexan/nixpkgs/howdy";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hycov = {
      url = "github:DreamMaoMao/hycov";
      inputs.hyprland.follows = "hyprland";
    };
    waybar.url = "github:Alexays/waybar";
    ags.url = "github:Aylur/ags";

    themes.url = "github:RGBCube/ThemeNix";

    schizofox.url = "github:schizofox/schizofox";

		lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";

      # Optional but recommended to limit the size of your system closure.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self
    , nixpkgs
    , nixvim
    , nur
    , nix-colors
    , ghostty
    , home-manager
    , flake-parts
    , auto-cpufreq
    , howdy
    , zls
    , zig
    , hyprland
    , themes
		, lanzaboote
    , ...
    }@inputs:
    let theme = themes.oxocarbon-dark;
    in {
      # default is nixos
      nixosConfigurations = { 
				darkdarcool = nixpkgs.lib.nixosSystem {
        	specialArgs = { inherit inputs; };
        	system = "x86_64-linux";
        	modules = [
						lanzaboote.nixosModules.lanzaboote
          	(./overlays.nix)
          	nur.nixosModules.nur
          	{
            	environment.systemPackages =
              	[ ghostty.packages.x86_64-linux.default ];
          	}
          	auto-cpufreq.nixosModules.default
          	# Import the previous configuration.nix we used,
          	# so the old configuration file still takes effect
          	./configuration.nix
          	{ disabledModules = [ "security/pam.nix" ]; }
          	"${howdy}/nixos/modules/security/pam.nix"
          	"${howdy}/nixos/modules/services/security/howdy"
          	"${howdy}/nixos/modules/services/misc/linux-enable-ir-emitter.nix"
          	home-manager.nixosModules.home-manager
          	{
            	home-manager.useGlobalPkgs = true;
            	home-manager.useUserPackages = true;
							home-manager.backupFileExtension = "hm-backup";

            	home-manager.extraSpecialArgs = {
              	inherit nix-colors;
              	inherit nur;
              	inherit inputs;
              	theme = {
                	colors = theme;
                	fonts = {
                  	monospace = "Liga SFMono Nerd Font";
                  	serif = "MesloLGSDZ Nerd Font";
                  	code = "JetBrainsMono Nerd Font Mono";
                	};
              	};
            	};

            	home-manager.users.darkdarcool = {
              	imports = [
                	inputs.hyprland.homeManagerModules.default
                	# inputs.hyprlock.homeManagerModules.hyprlock
                	inputs.nur.hmModules.nur
                	inputs.nixvim.homeManagerModules.nixvim
                	inputs.schizofox.homeManagerModule
                	# ./hosts/darkdarcool/nvim.nix
                	./home.nix
              	];
            	};
          	}
        	];
				};
      };
    };
}
