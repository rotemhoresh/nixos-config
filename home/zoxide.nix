{
  lib,
  config,
  ...
}: let
  cfg = config.zoxide;
in {
  options.zoxide = {
    enable = lib.mkEnableOption "Zoxide";
  };

  config = lib.mkIf cfg.enable {
    programs.zoxide = {
      enable = true;

      enableBashIntegration = true;
    };
  };
}
