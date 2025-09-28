{ ... }:
{
  programs.git = {
    enable = true;
    userName = "stuckinforloop";
    userEmail = "device.neel@gmail.com";
    signing = {
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPfBJEL3jXncpwUwMX7BAoeLSHDFlKlGUrB/HPCabVgF";
      signByDefault = true;
    };

    ignores = [ "**/.DS_STORE" ];

    extraConfig = {
      github = {
        user = "stuckinforloop";
      };
      init = {
        defaultBranch = "master";
      };
      commit = {
        gpgsign = true;
        verbose = true;
      };
      gpg = {
        format = "ssh";
      };
      core = {
        editor = "nvim";
      };
      push = {
        default = "simple";
        autoSetupRemote = true;
        followTags = true;
      };
      pull = {
        rebase = true;
      };
      fetch = {
        prune = true;
        pruneTags = true;
        all = true;
      };
      rerere = {
        autoUpdate = true;
        enabled = true;
      };
      rebase = {
        autoSquash = true;
        autoStash = true;
        updateRefs = true;
      };
    };
  };
}
