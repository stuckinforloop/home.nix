{ self, ... }:
{
	# touch ID for sudo
	security.pam.services.sudo_local.touchIdAuth = true;

	# system defaults and preferences
	system = {
		startup.chime = false;

		defaults = {
			loginwindow = {
				GuestEnabled = false;
				DisableConsoleAccess = true;
			};

			dock = {
				autohide = true;
				autohide-delay = 0.0;
				autohide-time-modifier = 0.2;

				expose-animation-duration = 0.1;

				tilesize = 48;

				static-only = false; # show only open applications
				show-recents = false;
				show-process-indicators = true;

				orientation = "bottom";
				mineffect = "genie"; # or "scale"
			};

			finder = {
				AppleShowAllFiles = true; # hidden files
				AppleShowAllExtensions = true; # file extensions
				_FXShowPosixPathInTitle = true; # title bar full path
				ShowPathbar = true; # breadcrumb nav at bottom
				ShowStatusBar = true; # file count & disk space
			};

			CustomUserPreferences = {
				"com.apple.symbolichotkeys" = {
					AppleSymbolicHotKeys = {
						# disable spotlight hotkey (cmd + space)
						"64".enabled = false;
					};
				};
			};

			NSGlobalDomain = {
				NSAutomaticSpellingCorrectionEnabled = false;
				NSAutomaticCapitalizationEnabled = false;
				NSAutomaticPeriodSubstitutionEnabled = false;
				NSAutomaticWindowAnimationsEnabled = false;
				InitialKeyRepeat = 15;
				KeyRepeat = 1;
				ApplePressAndHoldEnabled = false;
			};
		};
	};
}
