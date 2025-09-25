{ pkgs, inputs, self, ... }:
{
	# list of files to imports
	imports = [
		./apps.nix
		./settings.nix

		# import home-manager module for darwin
		inputs.home-manager.darwinModules.home-manager
	];

	# basic system settings
	networking.hostName = "breakpoint";
	system = {
		primaryUser = "stuckinforloop";
		stateVersion = 6;
		configurationRevision = self.rev or self.dirtyRev or null;
	};
	users.users = {
		"stuckinforloop" = {
			name = "stuckinforloop";
			home = "/Users/stuckinforloop";
			shell = pkgs.fish;
			uid = 501;
		};
	};
	programs.fish.enable = true;
	users.knownUsers = [ "stuckinforloop" ];

	# home-manager configuration
	home-manager = {
		useGlobalPkgs = true;

		# tell home-manager to manage this user
		users.stuckinforloop = import ../home;

		extraSpecialArgs = {
			inherit inputs self;
		};
	};

	# core nix configuration
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

	# allow installing packages which are not open source
	nixpkgs.config.allowUnfree = true;
}
