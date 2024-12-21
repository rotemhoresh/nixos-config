{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.kitty;
in {
  options.kitty = {
    enable = lib.mkEnableOption "Kitty";
  };

  config = lib.mkIf cfg.enable {
    programs.kitty = {
      enable = true;

      font = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Regular";
        size = 12;
      };
    };
  };
}
