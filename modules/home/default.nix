{ ... }:
{
  imports = [
    # defines which packages to install
    ./packages.nix

    # package level configuration
    ./fish.nix
    ./git.nix
    ./nix.nix
    ./mise.nix
    ./nvim.nix
    ./ssh.nix
    ./zoxide.nix

    # script symlinks
    ./scripts.nix
  ];

  # release branch of home-manager
  home.stateVersion = "25.11";
}
