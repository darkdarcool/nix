{ inputs, withSystem, ... }:

{
  flake =
    let
      lib = import ../parts/lib/import.nix { inherit inputs; };
      inherit (lib)
        concatLists
        mkMerge
        mkSystems
        ;
      sharedArgs = {
        inherit lib;
      };

      #laptop = import ../configuration.nix;

      shared = [
        #base
        #homes
      ];

    in
    mkMerge [
      (mkSystems [
        {
          # god of the river Achelous
          host = "darkdarcool";
          inherit withSystem;
          system = "x86_64-linux";
          modules = [
            # laptop
            #graphical
            #./darkdarcool/default.nix
          ] ++ concatLists [ shared ];
          specialArgs = { inherit lib; };
        }
      ])
    ];
}
