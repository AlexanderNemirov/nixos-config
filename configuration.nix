# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, user, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Grub configuration
  boot.loader = {
    efi = {
     canTouchEfiVariables = true;
     efiSysMountPoint = "/boot";
    };
    grub = {
     enable = true;
     devices = ["nodev"];
     efiSupport = true;
     useOSProber = true;
     configurationLimit = 5;
    };
  };

  # Wayland configuration
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };


  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1.localhost.internal.domain";

  time.timeZone = "Europe/Berlin";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "de_DE.UTF-8/UTF-8"
      "ru_RU.UTF-8/UTF-8"
    ];
    extraLocaleSettings = {
      LC_TIME = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
    };
  };
  console = {
    font = "Lat2-Terminus16";
    # keyMap = "us";
    useXkbConfig = true; # use xkbOptions in tty.
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable the X11 windowing system.
  #services = {
  #  xserver = {
  #    enable = true;
  #    autorun = true;

  #    xautolock.enable = false;
  #    windowManager.i3.enable = true;
  #    desktopManager = {
  #      xterm.enable = false;
  #  	  xfce = {
  #    	  enable = true;
  #    	  noDesktop = true;
  #    	  enableXfwm = false;
  #      };
  #    };
  #    displayManager = {
  #      lightdm.enable = true;
  #      defaultSession = "xfce+i3";
  #    };

      # Configure keymap in X11
  #    layout = "us,ru";
  #    xkbOptions = "grp:win_space_toggle, compose:ralt";
  #  };
  #};

  # Enable Polkit to setup Wayland in home manager
  security.polkit.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  sound.mediaKeys.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
  };

  users.users.${user} = {
     isNormalUser = true;
     extraGroups = [
       "wheel"
       "audio"
       "sound"
       "video"
       "networkmanager"
       "input"
       "tty"
     ];     
  };

   fonts.fonts = with pkgs; [                # Fonts
    carlito                                 # NixOS
    vegur                                   # NixOS
    source-code-pro
    jetbrains-mono
    font-awesome                            # Icons
    corefonts                               # MS
    (nerdfonts.override {                   # Nerdfont Icons override
      fonts = [
        "FiraCode"
      ];
    })
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {
    systemPackages = with pkgs; [
      helix
      git
      wget
      killall
      # pciutils
      # usbutils
    ];

    variables = {
      TERMINAL = "alacritty";
      EDITOR = "helix";
      VISUAL = "helix";
      BROWSER = "vivaldi";
    };
  };

  networking = {
    firewall = {
      allowedUDPPorts = [ 51820 ];
    };
    # wg-quick.interfaces = import ./wireguard.nix;
    hostName = "nixos"; # Define your hostname.
    networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}

