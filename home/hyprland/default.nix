{ lib, config, ... }:

let
  cfg = config.hyprland;
in
{
  imports = [
    ./binds.nix
    ./rules.nix
    ./env.nix
    ./input.nix
    ./look.nix
    ./vars.nix
    ./autostart.nix

    ./hyprpaper.nix
    ./hyprcursor.nix
  ];

  options.hyprland = {
    enable = lib.mkEnableOption "Hyprland";
  };

  config = lib.mkIf cfg.enable {
    # Enable all the stuff configured in the imports,
    # thus making them disabled if the this module is disabled.
    wayland.windowManager.hyprland.enable = true;
    services.hyprpaper.enable = true;
  };
}
