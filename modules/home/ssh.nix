{ config, ... }:
let
  # path to 1password ssh agent socket
  opSSHAgent = "${config.home.homeDirectory}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
in
{
  home.sessionVariables = {
    # set SSH_AUTH_SOCK to 1password ssh agent socket
    SSH_AUTH_SOCK = opSSHAgent;
  };
}
