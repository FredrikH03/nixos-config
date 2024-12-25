{ config, pkgs, inputs, ... }:


{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
      ../../modules/bootloader/grub.nix
      ../../modules/network/bluetooth.nix
      ../../modules/dev-stack/dev-stack.nix
      ../../modules/audio/audio.nix
      ../../modules/graphics/compositor/wayland.nix
      ../../modules/graphics/desktop/plasma.nix
    ];


  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  nix.settings.experimental-features = [ "nix-command" "flakes"];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;


  # Set your time zone.
  time.timeZone = "Europe/Stockholm";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "se";
    variant = "us";
  };

  # Configure console keymap
  console.keyMap = "sv-latin1";

  # Enable CUPS to print documents.
  services.printing.enable = true;


  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [

    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "user" = import ./home.nix;
    };
  };


  virtualisation.docker.enable = true;


  services.mullvad-vpn.enable = true;


  # Install firefox.
  programs.firefox.enable = true;

  programs.steam = {
  enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

 
  environment.systemPackages = with pkgs; [
    nerdfonts
    kdePackages.kate
    thunderbird
    steam
    vesktop
    brave
    teamspeak3
    mullvad-vpn
    kitty

    vscodium
    vscode
    dbeaver-bin
    jetbrains.datagrip
    pgadmin4-desktopmode

  ];

  fonts.packages = with pkgs; [
  noto-fonts
  noto-fonts-cjk-sans
  noto-fonts-color-emoji
  nerdfonts
  ];
  

  system.stateVersion = "24.11"; # Did you read the comment?

}
