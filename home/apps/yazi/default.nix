{ config, lib, pkgs, ... }:

{
  options.myHome.apps.yazi.enable = lib.mkEnableOption "Yazi 文件管理器";

  config = lib.mkIf config.myHome.apps.yazi.enable {
    programs.yazi = {
      enable = true;
    };
  };
}