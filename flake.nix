{
  description = "stuckinforloop's nix config";

  inputs = {
    # mother repo of all packages
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
    # for macos specific settings
    darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # for management of packages
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # to install neovim nightly
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      darwin,
      home-manager,
      ...
    }@inputs:
    let
      overlays = [
        inputs.neovim-nightly-overlay.overlays.default
      ];
    in
    {
      darwinConfigurations = {
        "breakpoint" = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = { inherit inputs self; };
          modules = [ ./hosts/breakpoint ];
        };

        "kernelpanic" = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = { inherit inputs self; };
          modules = [ ./hosts/razorpay ];
        };
      };

      homeConfigurations."stuckinforloop" = home-manager.lib.homeManagerConfiguration {
        system = "aarch64-darwin";
        modules = [
          {
            nixpkgs.overlays = overlays;
          }
        ];
      };
    };
}
