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

          colors = {
            background = "#000000";
            focusedWorkspace = {
              background = "#000000";
              border = "#859900";
              text = "#859900";
            };
            activeWorkspace = {
              background = "#000000";
              border = "#FFFFFF";
              text = "#FFFFFF";
            };
            inactiveWorkspace = {
              background = "#000000";
              border = "#93A1A1";
              text = "#93A1A1";
            };
            urgentWorkspace = {
              background = "#000000";
              border = "#DC322F";
              text = "#DC322F";
            };
            bindingMode = {
              background = "#000000";
              childBorder = "#B58900";
              text = "#B58900";
            };
          };
        }
      ];

      colors = {
        background = "#000000";
        focused = {
          background = "#000000";
          border = "#93A1A1";
          childBorder = "#93A1A1";
          indicator = "#93A1A1";
          text = "#859900";
        };
        focusedInactive = {
          background = "#000000";
          border = "#000000";
          childBorder = "#000000";
          indicator = "#000000";
          text = "#FFFFFF";
        };
        placeholder = {
          background = "#000000";
          childBorder = "#000000";
          text = "#FFFFFF";
        };
        unfocused = {
          background = "#000000";
          border = "#000000";
          childBorder = "#000000";
          indicator = "#000000";
          text = "#93A1A1";
        };
        urgent = {
          background = "#000000";
          border = "#DC322F";
          childBorder = "#DC322F";
          indicator = "#DC322F";
          text = "#DC322F";
        };
      };

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
