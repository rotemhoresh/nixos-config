{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.rust;
in {
  options.rust = {
    enable = lib.mkEnableOption "Rust";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      (fenix.complete.withComponents [
        "cargo"
        "clippy"
        "rust-src"
        "rustc"
        "rustfmt"
      ])
      rust-analyzer-nightly
    ];
  };
}
