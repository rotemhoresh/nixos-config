{ pkgs, ... }:

let
  conf = import ../config.nix;
in
{
  imports = [
    ./fonts.nix
    ./alacritty.nix
    ./helix.nix
    ./git.nix
    ./starship.nix
    ./tmux.nix

    ./hyprland

    ./go.nix
    ./rust.nix
    ./docker.nix
  ];

  home.username = conf.me.username;
  home.homeDirectory = "/home/${conf.me.username}";

  git = {
    enable = true;
    name = conf.me.fullname;
    email = conf.me.email;
  };

  hyprland.enable = true;

  helix.enable = true;

  go.enable = true;

  docker.enable = true;

  alacritty.enable = true;

  starship.enable = true;

  tmux.enable = true;

  home.packages = with pkgs; [
    # utils
    ripgrep
    fzf
    jq
    sqlite

    # misc
    neofetch
    which

    stremio
    spotify
    discord

    hyprsunset

    gnupg

    lldb

    yaml-language-server

    nixd
    nixfmt-rfc-style

    taplo

    python3
  ];

  programs.zoxide = {
    enable = true;

    enableBashIntegration = true;
  };

  programs.bash = {
    enable = true;

    enableCompletion = true;

    bashrcExtra = ''

    '';

    profileExtra = ''
      if [[ $(tty) == /dev/tty1 ]]; then
        exec Hyprland
      fi
    '';

    shellAliases = {
      h = "hx .";
    };
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
