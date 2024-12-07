{ pkgs, ... }:

{
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
          formatter = {
            command = "nixfmt";
          };
        }
      ];
    };

    settings = {
      theme = "my_theme";
      editor = {
        line-number = "relative";
        mouse = false;
        rulers = [
          80
        ];
        bufferline = "multiple";
        popup-border = "all";
      };
    };
  };

}
