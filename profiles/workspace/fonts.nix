{ pkgs, ...}: {
  fonts = {
    enableDefaultFonts = true;
    fonts = with pkgs; [                      # Fonts
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
    fontconfig = {
      defaultFonts = {
        monospace = [ "JetBrains Mono" ];
      };
    };
  };
}