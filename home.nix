{ pkgs, ... }: {
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./rofi
    ./wezterm
    ./picom.nix
    # ./bin/dwm_battery.nix
    # ./bin/dwm_brightness.nix
    # ./bin/dwm_clock.nix
    # ./bin/dwm_cpu_temp.nix
    # ./bin/dwm_date.nix
    # ./bin/dwm_kernel.nix
    # ./bin/dwm_keyboard_layout.nix
    # ./bin/dwm_memory.nix
    # ./bin/dwm_network.nix
    # ./bin/dwm_traffic.nix
    # ./bin/dwm_uptime.nix
    # ./bin/dwm_volume.nix
    # ./bin/set_resolution.nix
  ]; 

  home.packages = with pkgs; [
    pulseaudio
    pamixer
    pavucontrol
    procps
    brightnessctl
    vim
    xclip
    chromium
    git
    zsh
    discord
  ];
}
