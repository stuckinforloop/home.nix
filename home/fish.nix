{ pkgs, ... }:
let
	theme-src = pkgs.fetchFromGitHub {
		owner = "oh-my-fish";
    	repo = "theme-default";
    	rev = "38a404d533f49c402f4a9212319ce70395d740d8";
		sha256 = "sha256-FVZhJo6BTz5Gt7RSOnXXU0Btxejg/p89AhZOvB9Xk1k=";
	};
in
{
	programs.fish = {
		enable = true;

		generateCompletions = true;

		shellAliases = {
			ls="eza -l --git";
			ll="ls";

			ta="tmux at";

			vim="nvim";
			vi="nvim";
		};

		interactiveShellInit = ''
			set -g fish_greeting
		'';
	};

	home.file = {
    	".config/fish/functions/fish_prompt.fish" = {
      		source = "${theme-src}/fish_prompt.fish";
    	};

    	".config/fish/functions/fish_right_prompt.fish" = {
      		source = "${theme-src}/fish_right_prompt.fish";
    	};
  	};
}
