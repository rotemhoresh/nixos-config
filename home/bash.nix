{
  lib,
  config,
  ...
}: let
  cfg = config.bash;
in {
  options.bash = {
    enable = lib.mkEnableOption "Bash";
  };

  config = lib.mkIf cfg.enable {
    programs.bash = {
      enable = true;

      enableCompletion = true;

      bashrcExtra = ''

      '';

      # profileExtra = ''
      #   if [[ $(tty) == /dev/tty1 ]]; then
      #     exec Hyprland
      #   fi
      # '';

      shellAliases = {
        h = "hx .";
        sudoh = "sudo hx .";
        ls = "ls --color=auto --hyperlink=auto -F";
        ll = "ls -lAh";
        icat = "kitten icat";
        rl = "recall";
      };
    };
  };
}
