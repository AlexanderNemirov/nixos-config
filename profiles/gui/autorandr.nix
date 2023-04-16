{ ... }:
{
  services.autorandr = {
    enable = true;
    ignoreLid = true;
  };
  
  programs.autorandr = {
    enable = true;

    profiles = let
      eDP-1-edid = "00ffffffffffff0009e5470700000000121b0104a5221378021bbba658559d260e4f55000000010101010101010101010101010101019c3b803671383c403020360058c21000001afd2d800e713828403020360058c21000001a000000fe00424f452043510a202020202020000000fe004e5631353646484d2d4e36310a0030";
      HDMI-1-edid = "00ffffffffffff001e6d4a77971603000420010380502178eaf4f4af4e42ac260e50542109007140818081c0a9c0b300d1c08100d1cf30b870e0d0a04a5030203a00204f3100001a000000fd0030781e8239000a202020202020000000fc004c4720554c545241474541520a000000ff003230344e54565335593339310a01b5020350f1230907074c1004031f13125d5e5f60613f830100006d030c002000b83c20006001020368d85dc40178800300e30f00066d1a0000020530780004613d613de305c000e2006ae606050161613d336970aad0a0345030203a00204f3100001a6fc200a0a0a05550302035007a843100001a000000000000000000000003";

      mkWifiHook = on: "nmcli radio wifi ${
        if on
        then "on"
        else "off"
      }";

    in {
      mobile = {
        fingerprint.eDP-1 = eDP-1-edid;
        config = {
          eDP-1 = {
            crtc = 0;
            primary = true;
            position = "0x0";
            mode = "1920x1080";
            rate = "60.00";
          };
        };
        hooks.postswitch = ''
        ${mkWifiHook true}
        '';
      };

      docked = {
        fingerprint = {
          eDP-1 = eDP-1-edid;
          HDMI-1 = HDMI-1-edid;
        };
        config = {
          eDP-1.enable = false;
          HDMI-1 = {
            crtc = 0;
            primary = true;
            position = "0x0";
            mode = "3440x1440";
            rate = "60.00";
          };
        };
        hooks.postswitch = ''
        ${mkWifiHook false}
        '';
      };
    };
      
  };
}
