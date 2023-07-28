{ mod, pkgs, ... }:
{
  "${mod}+d" = "exec ${pkgs.rofi}/bin/rofi -show run";
  "${mod}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
  # "${mod}+Shift+Return" = "exec xterm";
  "${mod}+Shift+q" = "kill";
  # "${mod}+Shift+h" = "exec dm-tool switch-to-greeter";
  # "${mod}+Shift+m" = "exec amixer -q sset Master toggle";
  # "${mod}+Alt+s" = "exec kill $(pgrep -f shutter); shutter -s";
  "XF86AudioRaiseVolume" = "exec amixer -q sset Master 5%+";
  "XF86AudioLowerVolume" = "exec amixer -q sset Master 5%-";
  "XF86AudioMute" = "exec amixer -q sset Master toggle";

  "${mod}+Shift+minus" = "move scratchpad";
  "${mod}+minus" = "scratchpad show";

  # change focus
  "${mod}+h" = "focus left";
  "${mod}+j" = "focus down";
  "${mod}+k" = "focus up";
  "${mod}+l" = "focus right";
  "${mod}+Left" = "focus left";
  "${mod}+Down" = "focus down";
  "${mod}+Up" = "focus up";
  "${mod}+Right" = "focus right";

  # move focused window
  "${mod}+Shift+h" = "move left";
  "${mod}+Shift+j" = "move down";
  "${mod}+Shift+k" = "move up";
  "${mod}+Shift+l" = "move right";
  "${mod}+Shift+Left" = "move left";
  "${mod}+Shift+Down" = "move down";
  "${mod}+Shift+Up" = "move up";
  "${mod}+Shift+Right" = "move right";

  # change split orientation
  "${mod}+Shift+semicolon" = "split h";
  "${mod}+Shift+v" = "split v";

  # change container layout
  "${mod}+semicolon" = "layout splith";
  "${mod}+v" = "layout splitv";
  "${mod}+s" = "layout stacking";
  "${mod}+w" = "layout tabbed";
  "${mod}+e" = "layout toggle split";

  # enter fullscreen mode for the focused container
  "${mod}+Shift+f" = "fullscreen";

  # toggle floating/tiling
  "${mod}+Shift+space" = "floating toggle";

  # change focus between floating/tiling windows
  "${mod}+space" = "focus mode_toggle";

  # switch to workspace
  "${mod}+1" = "workspace 1";
  "${mod}+2" = "workspace 2";
  "${mod}+3" = "workspace 3";
  "${mod}+4" = "workspace 4";
  "${mod}+5" = "workspace 5";
  "${mod}+6" = "workspace 6";
  "${mod}+7" = "workspace 7";
  "${mod}+8" = "workspace 8";
  "${mod}+9" = "workspace 9";
  "${mod}+0" = "workspace 10";

  # move focused container to workspace
  "${mod}+Shift+1" = "move container to workspace 1";
  "${mod}+Shift+2" = "move container to workspace 2";
  "${mod}+Shift+3" = "move container to workspace 3";
  "${mod}+Shift+4" = "move container to workspace 4";
  "${mod}+Shift+5" = "move container to workspace 5";
  "${mod}+Shift+6" = "move container to workspace 6";
  "${mod}+Shift+7" = "move container to workspace 7";
  "${mod}+Shift+8" = "move container to workspace 8";
  "${mod}+Shift+9" = "move container to workspace 9";
  "${mod}+Shift+0" = "move container to workspace 10";

  # reload the configuration file
  "${mod}+Shift+c" = "restart";

  # restart i3 inplace
  "${mod}+Shift+r" = "restart";

  # exit i3
  "${mod}+Shift+e" = "exec \"i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'\"";
}

