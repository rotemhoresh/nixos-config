{
  lib,
  config,
  ...
}: let
  cfg = config.waybar;
in {
  options.waybar = {
    enable = lib.mkEnableOption "Waybar";
  };

  config = lib.mkIf cfg.enable {
    programs.waybar = {
      enable = true;

      style = ''
        @define-color base #232136;
        @define-color surface #2a273f;
        @define-color overlay #393552;

        @define-color muted #6e6a86;
        @define-color subtle #908caa;
        @define-color text #e0def4;

        @define-color love #eb6f92;
        @define-color gold #f6c177;
        @define-color rose #ea9a97;
        @define-color pine #3e8fb0;
        @define-color foam #9ccfd8;
        @define-color iris #c4a7e7;

        @define-color highlightLow #2a283e;
        @define-color highlightMed #44415a;
        @define-color highlightHigh #56526e;

        * {
          font-family: "JetBrainsMono Nerd Font";
          font-size: 14px;
          border: none;
        }

        window#waybar {
          background: transparent;
          color: @text;
        }

        #workspaces button {
          color: @muted;
        }

        #workspaces button:hover {
          background: none;
          box-shadow: none;
          text-shadow: none;
        }

        #workspaces button.focused {
          background-color: transparent;
          box-shadow: none;
        }

        #workspaces button.active {
          color: @text;
        }

        #memory,
        #network,
        #battery,
        #language,
        #bluetooth {
          margin-left: 16px;
        }

        #memory,
        #battery,
        #clock,
        #language,
        #network {
          padding: 3px 9px;
          border-radius: 4px;
          background-color: @base;
          border: 1px solid @overlay;
        }

        #pulseaudio {
          padding: 3px 9px;
          border-bottom-right-radius: 4px;
          border-top-right-radius: 4px;
          background-color: @base;
          border: 1px solid @overlay;
          border-left: none;
        }

        #bluetooth {
          padding: 3px 9px;
          border-bottom-left-radius: 4px;
          border-top-left-radius: 4px;
          background-color: @base;
          border: 1px solid @overlay;
          border-right: none;
        }

        #memory {}

        #network {}

        #battery {}

        #battery.warning {
          color: @gold;
        }

        #battery.critical {
          color: @love;
        }
      '';

      settings = [
        {
          "layer" = "top";
          "position" = "left";
          "margin-top" = 10;
          "margin-bottom" = 10;
          "margin-left" = 5;
          "margin-right" = 0;
          "modules-left" = [
            "hyprland/workspaces"
          ];
          "modules-right" = [
            "disk"
          ];
          "disk" = {
            "format" = " ";
            "unit" = "GB";
          };
          "privacy" = {
            "icon-spacing" = 4;
            "icon-size" = 18;
            "transition-duration" = 250;
            "modules" = [
              {
                "type" = "screenshare";
                "tooltip" = true;
                "tooltip-icon-size" = 24;
              }
              {
                "type" = "audio-out";
                "tooltip" = true;
                "tooltip-icon-size" = 24;
              }
              {
                "type" = "audio-in";
                "tooltip" = true;
                "tooltip-icon-size" = 24;
              }
            ];
          };
          "hyprland/workspaces" = {
            "format" = "<sub>{icon}</sub>\n{windows}";
            "format-window-separator" = "\n";
            "window-rewrite-default" = " ";
            "show-special" = "true";
            "window-rewrite" = {
              "title<.*YouTube.*>" = " ";
              "class<firefox>" = " ";
              "class<clipse>" = " ";
              "title<Stremio - Freedom to Stream>" = "󰎁 ";
              "kitty" = " ";
              "title<.*WhatsApp.*>" = " ";
              "title<ChatGPT.*>" = " ";
              "title<Microsoft Copilot: Your AI companion.*>" = " ";
              "class<VirtualBox Machine>" = " ";
            };
          };
        }
        {
          "layer" = "top";
          "position" = "top";
          "margin-top" = 10;
          "margin-bottom" = 0;
          "margin-left" = 14;
          "margin-right" = 14;
          "spacing" = 0;
          "modules-left" = [
            "clock"
          ];
          "modules-center" = [
            "hyprland/window"
          ];
          "modules-right" = [
            "bluetooth"
            "pulseaudio"
            "memory"
            "hyprland/language"
            "network#wifi"
            "battery"
          ];
          "hyprland/language" = {
            "format-en" = "en";
            "format-he" = "he";
            "on-click" = "hyprctl switchxkblayout at-translated-set-2-keyboard next";
          };
          "hyprland/window" = {
            "rewrite" = {
              "h" = "Helix";
              "(=?.[0-9]+.) (.*) - YouTube — Mozilla Firefox" = "$1";
              "(.*) - YouTube — Mozilla Firefox" = "$1";
              "(.*) — Mozilla Firefox" = "$1";
            };
          };
          "clock" = {
            "format" = "  {:%d %b     %H:%M}";
          };
          "pulseaudio" = {
            "format" = "{icon} {volume}%";
            "format-muted" = " ";
            "format-icons" = {
              "default" = [
                ""
                " "
                " "
                " "
                " "
              ];
            };
          };
          "bluetooth" = {
            "format-off" = "󰂲 ";
            "format-disabled" = "󰂲 ";
            "format-on" = "󰂯 ";
            "format-connected" = "{num_connections}󰂱 ";

            "tooltip" = true;
            "tooltip-format" = "{device_enumerate}";

            "on-click" = "bluetooth toggle";
          };
          "memory" = {
            "format" = "󰍛 {}%";
          };
          "network#wifi" = {
            "format" = "{iframe}";
            "format-icons" = [
              "󰤯 "
              "󰤟 "
              "󰤢 "
              "󰤥 "
              "󰤨 "
            ];
            "format-disconnected" = "󰤮 ";
            "format-wifi" = "{icon} {signalStrength}%";

            "tooltip-format-wifi" = "{essid} ({signalStrength}%)";
            "tooltip-format-disconnected" = "Disconnected"; # toggle WiFi on click
            "on-click" = "nmcli radio wifi $(nmcli radio wifi | grep -q enabled && echo off || echo on)";
          };
          "battery" = {
            "states" = {
              "warning" = 20;
              "critical" = 10;
            };
            "format" = "{icon} {capacity}%";
            "format-charging" = "󰂄 {capacity}%";
            "format-plugged" = "󰂄 {capacity}%";
            "format-icons" = [
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
            "on-click" = "";
          };
        }
      ];
    };
  };
}
