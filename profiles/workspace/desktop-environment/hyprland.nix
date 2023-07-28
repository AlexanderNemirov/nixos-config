{ user, ...}: {

  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    # needs qt5.qtwayland in systemPackages
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    # Fix for some Java AWT applications
    _JAVA_AWT_WM_NONREPARENTING = "1";
    # In case cursor becomes invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };
  
  home-manager.users.${user}.wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    
    xwayland.enable = true;
  };
}