{ lib, config, ... }:

let
  cfg = config.alacritty;
in
{
  options.alacritty = {
    enable = lib.mkEnableOption "Alacritty";
  };

  config = lib.mkIf cfg.enable {
    programs.alacritty = {
      enable = true;

      settings = {
        font = {
          size = 12;
        };

        window = {
          opacity = 0.6;
        };
      };
    };
  };
}
