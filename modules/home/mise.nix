{ config, ... }:
let
  misePath = "${config.home.homeDirectory}/.config/home/dotfiles/mise";
in
{
  programs.mise = {
    enable = true;
    enableFishIntegration = true;
  };

  xdg.configFile."mise".source = config.lib.file.mkOutOfStoreSymlink misePath;
}
