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
    ./zoxide.nix
    ./bash.nix

    ./hyprland
    ./waybar.nix
    ./avizo.nix

    ./go.nix
    ./rust.nix
    ./docker.nix

    ./batterysave.nix # should go last
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
    wallpaper = "green-parrot.png";
    hcursor = "bibata-modern-classic-hyprcursor";
    xcursor = "bibata-modern-classic-xcursor";
  };
  waybar.enable = true;
  avizo.enable = true;
  helix.enable = true;
  go.enable = true;
  rust.enable = true;
  docker.enable = true;
  alacritty.enable = true;
  kitty.enable = true;
  starship.enable = true;
  tmux.enable = true;
  zoxide.enable = true;
  bash.enable = true;

  programs.hyprlock = {
    enable = true;
  };

  home.sessionPath = [
    "$HOME/.cargo/bin"
  ];

  home.packages = with pkgs; [
    ripgrep # recursive regex greping
    grex # create regexps to match test cases
    fzf # fuzzy finder
    jq # CLI to do json stuff
    unrar
    sqlite
    mdbook
    tree # view dir structure
    bat # print file content (like `cat`)
    neofetch
    which
    cowsay
    curl
    ffmpeg

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

    brightnessctl
    pamixer

    nwg-look

    stremio
    spotify
    discord

    gparted

    gnupg

    lldb

    yaml-language-server
    marksman # markdown
    markdown-oxide
    nixd
    nixfmt-rfc-style
    alejandra # nix formatter
    vscode-langservers-extracted
    taplo # toml
    python312
    python312Packages.python-lsp-server
  ];

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
