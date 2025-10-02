{ config, ... }:
let
  ghosttyPath = "${config.home.homeDirectory}/.config/home/dotfiles/ghostty";
in
{
  xdg.configFile."ghostty".source = config.lib.file.mkOutOfStoreSymlink ghosttyPath;
}
