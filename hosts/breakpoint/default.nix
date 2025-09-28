{ pkgs, ... }:
{
  imports = [
    ../../modules/darwin
  ];

  # machine-specific configuration
  networking.hostName = "breakpoint";
  system = {
    primaryUser = "stuckinforloop";
    stateVersion = 6;
  };
  users.users."stuckinforloop" = {
    name = "stuckinforloop";
    home = "/Users/stuckinforloop";
    shell = pkgs.fish;
    uid = 501;
  };
  users.knownUsers = [ "stuckinforloop" ];

  # import home-manager
  home-manager.users."stuckinforloop" = import ../../modules/home;
}
