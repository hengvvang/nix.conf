{ config, lib, pkgs, ... }:

{
  config = lib.mkIf (config.myHome.dotfiles.enable && config.myHome.dotfiles.lazygit.enable && config.myHome.dotfiles.lazygit.method == "external") {

    home.packages = with pkgs; [ lazygit ];
    
    # 方式3: 外部文件引用
    home.file.".config/lazygit/config.yml".source = ./configs/config.yml;
  };
}
