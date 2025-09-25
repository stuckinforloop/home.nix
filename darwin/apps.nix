{ pkgs, self, ... }:
{
	environment = {
		pathsToLink = [ "/Applications" ];

		systemPackages = with pkgs; [
			# gui apps to install
			_1password-gui
			betterdisplay
			discord
			ghostty-bin
			raycast
			spotify
		];
	};
}
