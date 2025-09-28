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
├── hosts/             # host-specific configurations
│   ├── breakpoint/    # configuration for breakpoint host
│   └── kernelpanic/   # configuration for kernelpanic host
├── modules/           # nix modules
│   ├── darwin/        # nix-darwin system modules
│   │   ├── ...
│   └── home/          # home-manager user modules
│       └── ...
└── dotfiles/          # frequently edited configuration files and scripts
    └── ...
```
