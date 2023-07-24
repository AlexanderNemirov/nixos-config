{ pkgs, ... }:
{
  programs.rofi-wayland = {
    enable = true;
    terminal = "${pkgs.alacritty}/bin/alacritty";
    theme = "DarkBlue";
  };
}
