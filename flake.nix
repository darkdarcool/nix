{
  description = "A simple NixOS flake";

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
      #url = "github:nix-community/nixvim/nixos-23.11";
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
  };

  outputs = { self, nixpkgs, home-manager, flake-parts, ... }@inputs: {
    #let 
    #	nixvimLib = nixvim.lib.x86_64-linux;
    #	nixvim' = nixvim.legacyPackages.x86_64-linux;
    #	nixvimModule = {
    #		inhert pkgs;
    #		module = import ./nvim.nix;
    #		extraSpecialArgs = {
    #		
    #		};
    # 	};
    #	nvim = nixvim'.makeNixvimWithModule nixvimModule;
    # default is nixos
    nixosConfigurations.darkdarcool = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      system = "x86_64-linux";
      modules = [
        (./overlays.nix)
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.darkdarcool = {
            imports = [
              inputs.nixvim.homeManagerModules.nixvim
              # ./hosts/darkdarcool/nvim.nix
              ./home.nix
            ];
          };
        }
      ];
    };


    #homeConfigurations.darkdarcool = home-manager.lib.homeManagerConfiguration {
    #	inherit nixpkgs;
    #	modules = [
    #		nixvim.homeManagerModules.nixvim
    #		./home.nix
    #		./nvim.nix
    #	];
    #};
  };
}
