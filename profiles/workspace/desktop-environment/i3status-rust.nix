{ ... }:
{
  programs.i3status-rust = {
    enable = true;
    bars = {
      bottom = {
        blocks = [
          {
            block = "disk_space";
            format = " $icon $available / $total ";
            info_type = "available";
            path = "/";
            interval = 60;
            warning = 20.0;
            alert = 10.0;
          }
          {
            block = "memory";
            format = " $icon $mem_used / $mem_total ";
            format_alt = " $icon_swap $swap_used / $swap_total ";
          }
          {
            block = "cpu";
            interval = 1;
          }
          {
            block = "load";
            format = " $icon $1m ";
            interval = 1;
          }
          {
            block = "battery";
            format = " $icon $percentage ";
          }
          {
            block = "sound";
          }
          {
            block = "time";
            format = " $timestamp.datetime(f:'%a %d/%m %R') ";
            interval = 1;
          } 
        ];
      };
    };
  };
}
