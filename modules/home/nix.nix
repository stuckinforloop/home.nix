{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      # Nix language server
      nixd
      nixfmt-rfc-style
    ];
  };
}
