{
  config,
  ...
}:
let
  nvimPath = "${config.home.homeDirectory}/.config/home/dotfiles/nvim";
in
{
  programs.neovim = {
    enable = true;
    # package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
  };

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink nvimPath;
}
