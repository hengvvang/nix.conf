{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.myHome.profiles.envVar.environment.enable {
    # 环境变量配置
    home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "zen";
    TERMINAL = "alacritty";
    
    # 开发相关
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    
    # 工具配置
    BAT_THEME = "Dracula";
    MANPAGER = "bat";
  };
  };
}