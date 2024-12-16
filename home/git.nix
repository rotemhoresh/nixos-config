{
  lib,
  config,
  ...
}: let
  cfg = config.git;
in {
  options.git = {
    enable = lib.mkEnableOption "git";

    name = lib.mkOption {
      type = lib.types.str;
      description = "Name associated with all git actions";
    };
    email = lib.mkOption {
      type = lib.types.str;
      description = "Email address associated with all git actions";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;

      userName = cfg.name;
      userEmail = cfg.email;

      signing = {
        key = "FA5492BE76A4974A";
        signByDefault = true;
      };

      extraConfig = {
        core = {
          editor = "hx";
        };
        init = {
          defaultBranch = "main";
        };
      };
    };
  };
}
