{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.docker;
in
{
  options.docker = {
    enable = lib.mkEnableOption "Docker";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      docker-compose-language-service
      dockerfile-language-server-nodejs
    ];
  };
}
