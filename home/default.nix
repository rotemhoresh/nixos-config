{pkgs, ...}: let
  conf = import ../config.nix;
in {
  imports = [
    ./fonts.nix
    ./alacritty.nix
    ./kitty.nix
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
  hyprland = {
    enable = true;
    hyprsunset = true;
    wallpaper = "dots.jpg";
    hcursor = "bibata-modern-classic-hyprcursor";
    xcursor = "bibata-modern-classic-xcursor";
  };
  helix.enable = true;
  go.enable = true;
  rust.enable = true;
  docker.enable = true;
  alacritty.enable = true;
  kitty.enable = true;
  starship.enable = true;
  tmux.enable = true;

  programs.hyprlock = {
    enable = true;
  };

  home.packages = with pkgs; [
    # utils
    ripgrep
    fzf
    jq
    unrar
    sqlite

    # screenshots
    grim
    slurp
    hyprpicker
    hyprshot

    rofi-wayland

    libnotify

    gcc

    sqlx-cli

    # TODO: delete me
    librsvg
    xorg.xcursorgen

    # misc
    neofetch
    which
    cowsay

    brightnessctl
    pamixer

    nwg-look

    mdbook

    stremio
    spotify
    discord

    gparted

    gnupg

    lldb

    yaml-language-server

    marksman
    markdown-oxide

    nixd
    nixfmt-rfc-style
    alejandra

    vscode-langservers-extracted

    taplo

    python312
    python312Packages.python-lsp-server
  ];

  services.avizo = {
    enable = true;
    settings = {
      default = {
        time = 2;
      };
    };
  };

  programs.zoxide = {
    enable = true;

    enableBashIntegration = true;
  };

  programs.bash = {
    enable = true;

    enableCompletion = true;

    bashrcExtra = ''

    '';

    # profileExtra = ''
    #   if [[ $(tty) == /dev/tty1 ]]; then
    #     exec Hyprland
    #   fi
    # '';

    shellAliases = {
      h = "hx .";
      sudoh = "sudo hx .";
    };
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
