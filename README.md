# NixOS configuration

## Prerequisites

### NixOS

A machine with the Nix operating system. 

#### Note

Make sure that the configuration in the `nixos/hardware-config.nix` and the system definition in the `flake.nix` matches with your system (check your current configurations).

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
