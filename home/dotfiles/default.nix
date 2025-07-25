{ config, lib, pkgs, ... }:

{
  options.myHome.dotfiles = {
    enable = lib.mkEnableOption "Dotfiles 配置管理";
  };

  imports = [
    ./vim
    ./zsh
    ./bash          # 新增 Bash Shell 配置
    ./fish
    ./nushell
    ./yazi
    ./ghostty
    ./alacritty     # 新增 Alacritty 终端
    ./rio           # 新增 Rio GPU 加速终端
    ./tmux          # 新增 Tmux 会话管理
    ./zellij        # 新增 Zellij 终端多路复用器
    ./git
    ./lazygit
    ./starship
    ./qutebrowser   # 新增 Qutebrowser 浏览器配置
    ./obs-studio    # 新增 OBS Studio 配置
    ./rmpc          # 新增 RMPC 音乐播放器客户端
    ./vscode        # 新增 Visual Studio Code 代码编辑器
    ./zed           # 新增 Zed Editor 高性能代码编辑器
  ];
}
