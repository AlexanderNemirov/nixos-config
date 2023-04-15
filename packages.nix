pkgs: with pkgs; [
  wget
  git
  curl
  alacritty
  ranger
  helix
  wireguard-tools
  tdesktop
  bitwarden
  obsidian
  (vivaldi.override {
    proprietaryCodecs = true;
    enableWidevine = true;
  })
]
