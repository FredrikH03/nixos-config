{ config, pkgs, inputs, ... }:

{
  # Enables KDE my beloved (time to krash), and also sddm
  # split up sddm from plasma later? or have login stuff together with DE? idk
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
}