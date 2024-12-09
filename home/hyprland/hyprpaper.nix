{ lib, config, ... }:

let
  cfg = config.hyprland;
in
{
  options.hyprland = {
    wallpaper = lib.mkOption {
      type = lib.types.str;
      description = "The name of the wallpaper file to use (must be in the wallpapers directory)";
    };
  };

  config = {
    services.hyprpaper = {
      settings = {
        preload = [
          "/home/rotemhoresh/nixos-config/wallpapers/${cfg.wallpaper}"
        ];
        wallpaper = [
          ", /home/rotemhoresh/nixos-config/wallpapers/${cfg.wallpaper}"
        ];
      };
    };
  };
}
