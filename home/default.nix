{ pkgs, ... }:

let
  config = import ../config.nix;
in
{
  imports = [
    ./fonts.nix
    ./alacritty.nix
    ./helix.nix

    ./hyprland

    ./go.nix
    ./rust.nix
    ./docker.nix
  ];

  home.username = config.me.username;
  home.homeDirectory = "/home/${config.me.username}";

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

    hyprsunset

    gnupg

    lldb

    yaml-language-server

    nixd
    nixfmt-rfc-style

    taplo

    python3
  ];

  programs.tmux = {
    enable = true;

    clock24 = true;
    mouse = false;

    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = rose-pine;
        extraConfig = ''
          set -g @rose_pine_variant 'moon'
        '';
      }
    ];
  };

  programs.git = {
    enable = true;

    userName = config.me.fullname;
    userEmail = config.me.email;

    signing = {
      key = "FA5492BE76A4974A";
      signByDefault = true;
    };

    extraConfig = {
      core = {
        editor = "hx";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };

  programs.starship = {
    enable = true;

    enableBashIntegration = true;

    settings = {
      add_newline = true;
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

    shellAliases = {
      h = "hx .";
    };
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
