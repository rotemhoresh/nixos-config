{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprpaper
  ];

  services.hyprpaper = {
    enable = true;

    settings = {
      preload = [
        "/home/rotemhoresh/nixos-config/wallpapers/space.jpg"
      ];
      wallpaper = [
        ", /home/rotemhoresh/nixos-config/wallpapers/space.jpg"
      ];
    };
  };
}
