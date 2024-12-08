{ lib, config, ... }:

let
  cfg = config.starship;
in
{
  options.starship = {
    enable = lib.mkEnableOption "Startship";
  };

  config = lib.mkIf cfg.enable {
    programs.starship = {
      enable = true;

      enableBashIntegration = true;

      settings = {
        add_newline = true;
      };
    };
  };
}
