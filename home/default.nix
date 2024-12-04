{ config, pkgs, ... }:

{
  imports = [
    ./fonts.nix
  ];

  home.username = "rotemhoresh";
  home.homeDirectory = "/home/rotemhoresh";

  home.packages = with pkgs; [
    # utils
    ripgrep
    fzf

    # misc
    neofetch
    which

    gnupg

    # lsp
    nixd
    taplo

    # langs
    rustup
    python3
    go
  ];

  programs.helix = {
    enable = true;

    defaultEditor = true;

    ignores = [
      "target/"
      "Cargo.lock"
    ];

    themes = {
      my_theme = {
        inherits = "rose_pine_moon";
        "ui.background" = { };
      };
    };

    languages = {
      language-server.nixd = with pkgs; {
        command = "${nixd}/bin/nixd";
      };

      language = [
        {
          name = "nix";
          language-servers = [
            "nixd"
          ];
        }
      ];
    };

    settings = {
      theme = "my_theme";
      editor = {
        line-number = "relative";
        mouse = false;
      };
    };
  };

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

    userName = "Rotem Horesh";
    userEmail = "horesh.rotem@gmail.com";

    signing = {
      key = "FA5492BE76A4974A";
      # key = null;
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

  programs.alacritty = {
    enable = true;

    settings = {
      font = {
        size = 12;
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

    shellAliases = {
      h = "hx .";
    };
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
