{ pkgs, ... }:
{
  imports = [
    ../../modules/darwin
  ];

  # machine-specific configuration
  networking.hostName = "kernelpanic";
  system = {
    primaryUser = "neel.modi";
    stateVersion = 6;
  };

  users.users."neel.modi" = {
    name = "neel.modi";
    home = "/Users/neel.modi";
    shell = pkgs.fish;
    uid = 502;
  };
  users.knownUsers = [ "neel.modi" ];

  # import home-manager
  home-manager.users."neel.modi" = import ../../modules/home;
}
