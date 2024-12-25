{ config, pkgs, inputs, ... }:

{
  # wayland stuff
  services.displayManager.sddm.wayland.enable = true;
}