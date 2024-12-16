{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.go;
in {
  options.go = {
    enable = lib.mkEnableOption "Go";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      go
      gopls
      golangci-lint-langserver
      golangci-lint
      delve
    ];
  };
}
