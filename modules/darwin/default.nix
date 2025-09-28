{
  inputs,
  self,
  ...
}:
{
  # list of files to imports
  imports = [
    ./apps.nix
    ./settings.nix
    # import home-manager module for darwin
    inputs.home-manager.darwinModules.home-manager
  ];

  # shared nix configuration
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      # auto-run the garbage collector to free up disk space
      auto-optimise-store = true;
    };

    # since we are managing nix via determinate-systems, tell nix-darwin to not manage
    enable = false;
  };

  # record the flake revision in the system configuration
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # allow use of unfree packages
  nixpkgs.config.allowUnfree = true;

  # shared home-manager configuration
  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs self;
    };
  };

  # NOTE: this is required for nix-darwin to properly
  # setup fish shell
  # TODO: find the right fix
  programs.fish.enable = true;
}
