{ lib, pkgs, user, ... }:

{
  imports = 
    (import ./profiles/cli) ++
    (import ./profiles/gui);


  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    stateVersion = "22.05";

    packages = with pkgs; [
      #cli
      git
      ranger
      alacritty
      htop
      helix
      curl
      unzip
      zip
      wget

      #gui
      autorandr
      rofi-wayland
      mako
      libnotify

      #network
      wireguard-tools

      #apps
      tdesktop
      bitwarden
      obsidian

      #browsers
      (vivaldi.override {
        proprietaryCodecs = true;
        enableWidevine = true;
      })

    ];
  };

  programs = {
    home-manager.enable = true;
  };

  # xdg.enable = true;
  # Wayland
  services = {
    mako.enable = true;
  }

}
