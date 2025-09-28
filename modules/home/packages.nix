{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      # shell
      # fish (part of ./fish.nix)

      # terminal emulator
      # ghostty-bin (part of /darwin/apps.nix)

      # editors
      # nvim (part of ./nvim.nix)
      nixd # nix lsp server

      # ai tools
      claude-code

      # version control
      git
      jujutsu

      # dev tools
      curl
      wget
      tmux
      ripgrep
      zoxide
      fzf
      eza
      bat
      tree
      fd
      jq
      # mise (part of ./mise.nix)
      openssh

      # fonts
      nerd-fonts.geist-mono
    ];
  };
}
