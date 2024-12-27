{
  wayland.windowManager.hyprland.extraConfig = ''
    bind = , backslash, submap, resize
    submap = resize
      # sets repeatable binds for resizing the active window
      binde = , right, resizeactive, 10 0
      binde = , left, resizeactive, -10 0
      binde = , up, resizeactive, 0 -10
      binde = , down, resizeactive, 0 10

      bind = , backslash, pass,

      bind = , escape, submap, reset
    submap = reset
  '';
}
