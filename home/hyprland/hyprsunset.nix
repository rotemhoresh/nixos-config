{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.hyprland;
in {
  options.hyprland = {
    hyprsunset = lib.mkOption {
      type = lib.types.bool;
      description = "Whether to enable blue light filtering";
    };
  };

  config = lib.mkIf cfg.hyprsunset {
    home.packages = with pkgs; [
      hyprsunset
    ];

    wayland.windowManager.hyprland.settings = {
      exec-once = [
        "hyprsunset" # blue light filter
      ];
    };
  };
}
