{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    wget
    btop
    neovim
    fastfetch
  ];
}