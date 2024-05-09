{
  description = "Home Manager configuration of jason";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, neovim-nightly-overlay, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system} // {
        overlays = [
          neovim-nightly-overlay.overlay
          (final: prev: {
            vimPlugins = prev.vimPlugins // {
              oil-nvim = prev.vimUtils.buildVimPlugin {
                pname = "oil";
                version = "2024-04-26";
                src = prev.fetchgit {
                  url = "https://github.com/stevearc/oil.nvim";
                  rev = "f3a31eba24587bc038592103d8f7e64648292115";
                  hash = "sha256-JlA5/qU3U/uAuNt9iVIsIUnULxtxpzoO49ooF8MY3gw=";
                  fetchSubmodules = true;
                };
                meta.homepage = "https://github.com/stevearc/oil.nvim";
              };
            };
          })

        ];
        config = { allowUnfree = true; };
      };
    in
    {
      homeConfigurations."jason" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
        extraSpecialArgs = { inherit inputs; };
      };
    };
}
