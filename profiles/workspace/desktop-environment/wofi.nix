{ user, ... }: {
  home-manager.${user}.programs.wofi = {
    enable = true;
    settings = {
      location = "center";
    };
  };
}