# NixOS configuration

## Prerequisites

### NixOS

A machine with the Nix operating system. 

#### Note

Make sure that the configuration in the `nixos/hardware-configuration.nix` and the system definition in the `flake.nix` matches with your system (check your current configurations).

### Git

Add git to your `configuration.nix` (found in `/etc/nixos`):

```nix
environment.systemPackages = with pkgs; [
  git 
]
```

## Setup

First, backup your current NixOS configurations:

```bash
sudo mv /etc/nixos /etc/nixos.bak
```

Then, clone this repository to your home (`~`) directory:

```bash
z  # or `cd`, if you don't use zoxide
git clone git@github.com:rotemhoresh/nixos-config.git
```

Now, create a symbolic link in `/etc/nixos` to your configuration directory in `~/nixos-config`:

```bash
sudo ln -s ~/nixos-config /etc/nixos
```

Finally, rebuild your system deploying the new configurations:

```bash
# use the script provided by this repo (only in the `~/nixos-config`):
./s

# or, from anywhere:
sudo nixos-rebuild switch
```

## About

### Scripts

- `s`: A script that rebuilds the system. It does the following:
  - Format all `.nix` files in the repo, using [alejandra](https://github.com/kamadorueda/alejandra), 
  - Rebuild the system.
  - Create a commit for the newly created generation.

  Thanks: 
  - [NoBoilerplate](https://www.youtube.com/c/NoBoilerplate)
- `trim-generations.sh`: A script to streamline cleaning past system generations. I usually use it like this:
  ```bash
  sudo ./trim-generations.sh 5 0 system
  ```
  Which removes all past generations except the last 5.

  Thanks:
  - [NixOS Wiki](https://nixos.wiki/wiki/NixOS_Generations_Trimmer)
  
### DE

This configuration uses [Hyprland](https://hyprland.org/) as the Desktop Environment.
