{
  wayland.windowManager.hyprland.settings = {
    env = [
      # Try to force stuff to run on wayland
      "GDK_BACKEND, wayland,x11,*"
      "QT_QPA_PLATFORM, wayland;xcb"
      "SDL_VIDEODRIVER, wayland"
      "CLUTTER_BACKEND, wayland"
      "NIXOS_OZONE_WL, 1"
    ];
  };
}
