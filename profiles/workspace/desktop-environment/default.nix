[
  ./i3status-rust.nix
  ./sway.nix
]
{ user, ... }: {
  home-manager.${user} = {
    services = {
      mako.enable = true;
      network-manager-applet.enable = true;


    };

    programs = {
      wofi.enable = true;

    };
  };
}