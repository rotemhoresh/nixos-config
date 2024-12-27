{
  wayland.windowManager.hyprland.extraConfig = ''
    bind = , backslash, submap, main
    submap = main

      # allow sending backslashes to windows by repeating
      bind = , backslash, pass,

      bind = , V, exec, $terminal --class clipse -e 'clipse'

      bind = , F, fullscreen, 0
      bind = , C, killactive

      bind = , H, movefocus, l
      bind = , J, movefocus, d
      bind = , K, movefocus, u
      bind = , L, movefocus, r

      bind = , left, movefocus, l
      bind = , down, movefocus, d
      bind = , up, movefocus, u
      bind = , right, movefocus, r

      bind = , G, submap, goto
      submap = goto
        bind = , 1, workspace, 1
        bind = , 1, submap, reset
        bind = , 2, workspace, 2
        bind = , 2, submap, reset
        bind = , 3, workspace, 3
        bind = , 3, submap, reset
        bind = , 4, workspace, 4
        bind = , 4, submap, reset
        bind = , 5, workspace, 5
        bind = , 5, submap, reset
        bind = , 6, workspace, 6
        bind = , 6, submap, reset
        bind = , 7, workspace, 7
        bind = , 7, submap, reset
        bind = , 8, workspace, 8
        bind = , 8, submap, reset
        bind = , 9, workspace, 9
        bind = , 9, submap, reset
        bind = , 0, workspace, 10
        bind = , 0, submap, reset

        bind = , M, submap, move
        submap = move
           bind = , 1, movetoworkspace, 1
           bind = , 1, submap, reset
           bind = , 2, movetoworkspace, 2
           bind = , 2, submap, reset
           bind = , 3, movetoworkspace, 3
           bind = , 3, submap, reset
           bind = , 4, movetoworkspace, 4
           bind = , 4, submap, reset
           bind = , 5, movetoworkspace, 5
           bind = , 5, submap, reset
           bind = , 6, movetoworkspace, 6
           bind = , 6, submap, reset
           bind = , 7, movetoworkspace, 7
           bind = , 7, submap, reset
           bind = , 8, movetoworkspace, 8
           bind = , 8, submap, reset
           bind = , 9, movetoworkspace, 9
           bind = , 9, submap, reset
           bind = , 0, movetoworkspace, 10
           bind = , 0, submap, reset

          bind = , escape, submap, reset
        submap = reset

        bind = , escape, submap, reset
      submap = reset

      bind = , R, submap, resize
      submap = resize
        binde = , right, resizeactive, 10 0
        binde = , left, resizeactive, -10 0
        binde = , up, resizeactive, 0 -10
        binde = , down, resizeactive, 0 10

        binde = , L, resizeactive, 10 0
        binde = , H, resizeactive, -10 0
        binde = , K, resizeactive, 0 -10
        binde = , J, resizeactive, 0 10

        bind = , escape, submap, reset
      submap = reset

      bind = , escape, submap, reset
    submap = reset
  '';
}
