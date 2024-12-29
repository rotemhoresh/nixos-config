{
  lib,
  config,
  ...
}: let
  cfg = config.avizo;
in {
  options.avizo = {
    enable = lib.mkEnableOption "Avizo";
  };

  config = lib.mkIf cfg.enable {
    services.avizo = {
      enable = true;
      settings = {
        default = {
          time = 2;
        };
      };
    };
  };
}
