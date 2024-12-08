{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.tmux;
in
{
  options.tmux = {
    enable = lib.mkEnableOption "Tmux";
  };

  config = lib.mkIf cfg.enable {
    programs.tmux = {
      enable = true;

      clock24 = true;
      mouse = false;

      plugins = with pkgs.tmuxPlugins; [
        {
          plugin = rose-pine;
          extraConfig = ''
            set -g @rose_pine_variant 'moon'
          '';
        }
      ];
    };
  };
}
