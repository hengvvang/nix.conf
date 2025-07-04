
{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.mySystem.desktop.cosmic.enable {
    # ----- cosmic -----
    services = {
          displayManager.cosmic-greeter.package = pkgs.cosmic-greeter;
          displayManager.cosmic-greeter.enable = true;
          desktopManager.cosmic.enable = true;
          desktopManager.cosmic.xwayland.enable = true;
    };
  # environment.cosmic.excludePackages = [
  #   plasma-browser-integration # Comment out this line if you use KDE Connect
  #   kdepim-runtime # Unneeded if you use Thunderbird, etc.
  #   konsole # Comment out this line if you use KDE's default terminal app
  #   oxygen
  # ];



    environment.systemPackages = [
    ];
  };
}
