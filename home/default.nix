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
    ./waybar.nix
    ./tmux.nix

    ./hyprland

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
    wallpaper = "cave.jpg";
    hcursor = "bibata-modern-classic-hyprcursor";
    xcursor = "bibata-modern-classic-xcursor";
  };
  waybar.enable = true;
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

  home.sessionPath = [
    "$HOME/.cargo/bin"
  ];

  home.packages = with pkgs; [
    # utils
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

    # screenshots
    grim
    slurp
    hyprpicker
    hyprshot

    rofi-wayland

    libnotify

    gcc

    lsp-ai

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
      ls = "ls --color=auto --hyperlink=auto -F";
      ll = "ls -lAh";
      icat = "kitten icat";
      rl = "recall";
    };
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
