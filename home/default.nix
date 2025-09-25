{ ... }:
{
	imports = [
		# defines which packages to install
		./packages.nix

		# package level configuration
		./fish.nix
		./git.nix
		./mise.nix
		./nvim.nix
		./ssh.nix
        ./zoxide.nix

        # script symlinks
        ./scripts.nix
	];

	home = {
		username = "stuckinforloop";
		homeDirectory = "/Users/stuckinforloop";

		# release branch of home-manager
		stateVersion = "25.11";
	};
}
