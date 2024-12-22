{
  lib,
  config,
  ...
}: let
  cfg = config.batterysave;
in {
  options.batterysave = {
    enable = lib.mkEnableOption "Battery Save";
  };

  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland.settings = {
      misc = {
        vfr = true;
      };
      decoration = {
        blur.enabled = false;
        shadow.enabled = false;
      };
      animations.enabled = false;
    };
  };
}
