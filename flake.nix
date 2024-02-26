{
  description = "Home Manager configuration of jason";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      overlays = [
        inputs.neovim-nightly-overlay.overlay
      ];
    in
    {
      homeConfigurations."jason" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        configuration = { pkgs, ... }:
          {
            nixpkgs.overlays = overlays;
          };
        modules = [ ./home.nix ];
      };
    };
}
