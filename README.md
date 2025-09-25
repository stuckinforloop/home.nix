# stuckinforloop's nix config


> [!CAUTION]
> only enter if you know what you're doing


This repository contains my personal Nix configuration that manages:
- System-wide macOS settings via nix-darwin
- User environment and packages via home-manager
- Development tools and configurations
- Dotfiles and shell configurations


```
.
├── flake.nix          # entrypoint for the nix configuration
├── flake.lock         # pinned dependency versions
├── darwin/            # nix-darwin system configuration
│   └── ...
├── home/              # home-manager user configuration
│   └── ...
└── dotfiles/          # frequently edited configuration files and scripts
    ├── mise/          # mise configurations
    ├── nvim/          # nvim configurations
    └── scripts/       # custom shell scripts
```
