{ ... }:
{
  imports = [
    # defines which packages to install
    ./packages.nix

    # package level configuration
    ./fish.nix
    ./git.nix
    ./nix.nix
    ./ssh.nix
    ./zoxide.nix

    # symlinks
    ./ghostty.nix
    ./mise.nix
    ./nvim.nix
    ./scripts.nix
  ];

  # release branch of home-manager
  home.stateVersion = "25.11";
}
