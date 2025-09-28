{ config, ... }:
let
  scriptsPath = "${config.home.homeDirectory}/.config/home/dotfiles/scripts";
in
{
  xdg.configFile."scripts".source = config.lib.file.mkOutOfStoreSymlink scriptsPath;

  home.sessionPath = [
    "${config.home.homeDirectory}/.config/scripts"
  ];
}
