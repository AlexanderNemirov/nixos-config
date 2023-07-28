{ lib, pkgs, user, ... }:

{
  imports = 
    (import ./profiles/cli) ++
    (import ./profiles/workspace);


  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    stateVersion = "22.05";

    packages = with pkgs; [
      # cli tools
      git
      ranger
      btop
      curl
      zip
      unzip
      unrar
      wget

      # desktop-environment
      wofi 
      mako
      libnotify
      nm-applet

      # workspace
      alacritty
      helix

      # network
      wireguard-tools

      # apps
      tdesktop
      bitwarden
      obsidian

      # browsers
      (vivaldi.override {
        proprietaryCodecs = true;
        enableWidevine = true;
      })

    ];
  };

  programs = {
    home-manager.enable = true;
  };

}
