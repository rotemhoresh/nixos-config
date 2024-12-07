{
  imports = [
    ./binds.nix
    ./rules.nix
    ./env.nix
    ./input.nix
    ./look.nix
    ./vars.nix
    ./autostart.nix

    ./hyprpaper.nix
  ];

  wayland.windowManager.hyprland.enable = true;
}
