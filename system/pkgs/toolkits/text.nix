{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.mySystem.pkgs.toolkits.text.enable {
    environment.systemPackages = with pkgs; [
      # 文本搜索和处理
      ripgrep         # 现代 grep (rg - 更快搜索)
      choose          # 更好的 cut
      sd              # 现代 sed
      
      # 数据处理
      jq              # JSON 处理
      yq              # YAML 处理
      visidata        # 表格数据查看器
      
      # Git 工具
      delta           # 更好的 git diff
      lazygit         # Git GUI
      gitui           # 另一个 Git TUI
      
      # 文档工具
      tealdeer        # 快速 man 页面 (tldr)
      
      # 开发环境
      direnv          # 目录环境变量
      
      # 安全工具
      age             # 现代文件加密
      gnupg           # GPG 加密
      
      # 系统工具
      openssh         # SSH 客户端
    ];
  };
}
