{ config, pkgs, inputs, ... }:

# {
#   # grub stuff
#   boot.loader.systemd-boot.enable = false;
#   boot.loader.grub.enable = true;
#   boot.loader.grub.device = "nodev";
#   boot.loader.grub.useOSProber = true;
#   boot.loader.efi.canTouchEfiVariables = true;
#   boot.loader.grub.efiSupport = true;  # Enable UEFI GRUB support
#   boot.loader.efi.efiSysMountPoint = "/boot/efi";
# }

{
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/nvme0n1"; 
    enableCryptodisk = true; 
    efiSupport = true;
    efiInstallAsRemovable = true; 
    useOSProber = true; 
  };

  boot.loader.efi.efiSysMountPoint = "/boot/efi";
}