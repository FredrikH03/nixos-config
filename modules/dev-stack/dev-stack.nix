{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    postman
    docker

    # PHP stuff
    php84
    php84Packages.composer
    laravel

    nodejs
    git
    mysql84
    mariadb_114
    pgadmin4-desktopmode
  ];
}