{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.helix;
in {
  options.helix = {
    enable = lib.mkEnableOption "Helix Editor";
  };

  config = lib.mkIf cfg.enable {
    programs.helix = {
      enable = true;

      defaultEditor = true;

      ignores = [
        "target/"
        "Cargo.lock"

        "go.sum"

        "node_modules/"
      ];

      themes = {
        my_theme = {
          inherits = "rose_pine_moon";
          "ui.background" = {};
        };
      };

      languages = {
        language-server = {
          rust-analyzer.config.check.command = "clippy";
          nixd = with pkgs; {
            command = "${nixd}/bin/nixd";
          };
          iwe = {
            command = "~/test/iwe/target/release/iwes";
          };
        };

        language = [
          {
            name = "nix";
            language-servers = [
              "nixd"
            ];
            formatter = {
              command = "alejandra";
            };
            auto-format = true;
          }
          {
            name = "markdown";
            language-servers = [
              # "marksman"
              # "markdown-oxide"
              "iwe"
            ];
            auto-format = true;
          }
          {
            name = "python";
            auto-format = true;
          }
          {
            name = "typescript";
            auto-format = true;
          }
          {
            name = "javascript";
            auto-format = true;
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
          # popup-border = "all";
        };

        # keys = {
        #   normal = {
        #     g.l = [
        #       "select_mode"
        #       "goto_line_end"
        #       "normal_mode"
        #     ]; # make `gl` select to line end, instead of just go there
        #     g.h = [
        #       "select_mode"
        #       "goto_line_start"
        #       "normal_mode"
        #     ];
        #   };
        # };
      };
    };
  };
}
