{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    sf-mono-liga-src = {
    	url = "github:shaunsingh/SFMono-Nerd-Font-Ligaturized";
    	flake = false;
    };
    nixvim = {
    	url = "github:nix-community/nixvim/nixos-23.11";
	inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
  # default is nixos
    nixosConfigurations.darkdarcool = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      system = "x86_64-linux";
      modules = [
      	(./overlays.nix)
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./configuration.nix
	./nvim.nix
      ];
    };
  };
}
