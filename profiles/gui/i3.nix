{ pkgs, ... }:
let
  mod = "Mod4";
in
{
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = mod;

      gaps = {
        inner = 12;
        outer = 5;
        smartGaps = true;
        smartBorders = "off";
      };

      bars = [
        {
          position = "bottom";
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-bottom.toml";
        }
      ];

      menu = "${pkgs.rofi}/bin/rofi -show run";

      startup = [
      ];
      assigns = {
        "2" = [{ class = "vivaldi"; }];
        "3" = [{ class = "telegram"; }];
      };
      keybindings = import ./i3-keybindings.nix {
        inherit mod pkgs;
      };

      window = {
        titlebar = true;
      };
    };
  };
}
