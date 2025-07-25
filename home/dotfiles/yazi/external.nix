{ config, lib, pkgs, ... }:

{
  config = lib.mkIf (config.myHome.dotfiles.enable && config.myHome.dotfiles.yazi.enable && config.myHome.dotfiles.yazi.method == "external") {


    # ===== 包依赖确保 =====
    # 确保必要的系统工具可用
    home.packages = with pkgs; [
      # 核心文件管理器
      yazi

      # 预览增强工具
      file                    # 文件类型检测
      tree                    # 目录树显示

      # 图像预览支持
      imagemagick             # 图像处理和预览
      ffmpegthumbnailer       # 视频缩略图

      # 文档预览支持
      poppler_utils           # PDF 预览 (pdftoppm)
      unrar                   # RAR 文件预览
      unar                    # 通用解压工具

      # 代码语法高亮
      bat                     # 代码预览和语法高亮

      # 音视频预览
      mediainfo               # 媒体文件信息
      exiftool                # 图片元数据

      # 字体和图标支持
      nerd-fonts.fira-code    # Nerd Font 图标支持

      # 集成工具
      ripgrep                 # 快速搜索
      fd                      # 快速文件查找
      fzf                     # 模糊搜索
    ];

    home.file.".config/yazi/yazi.toml".source = ./configs/yazi.toml;
    home.file.".config/yazi/keymap.toml".source = ./configs/keymap.toml;
    home.file.".config/yazi/theme.toml".source = ./configs/theme.toml;
    home.file.".config/yazi/flavors".source = ./configs/flavors;
    home.file.".config/yazi/plugins".source = ./configs/plugins;
    home.file.".config/yazi/init.lua".source = ./configs/init.lua;


    # ===== 环境变量设置 =====
    home.sessionVariables = {
      # Yazi 配置目录
      YAZI_CONFIG_HOME = "$HOME/.config/yazi";

      # 启用图标和 Unicode 支持
      YAZI_FILE_ONE = "${pkgs.file}/bin/file";

      # 优化终端性能
      TERM_PROGRAM = "yazi";
    };

    # ===== Shell 集成 =====
    # 为不同 Shell 提供 yazi 集成函数
    programs.bash.initExtra = lib.mkIf config.programs.bash.enable ''
      # Yazi Shell 集成函数 - 支持目录跳转
      function yazi() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        command yazi "$@" --cwd-file="$tmp"
        IFS= read -r -d ''' cwd < "$tmp"
        [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
        rm -f -- "$tmp"
      }
      
      # 添加 Yazi 别名命令
      function y() { yazi "$@"; }
      function ya() { yazi "$@"; }
      function yz() { yazi "$@"; }
    '';

    programs.zsh.initContent = lib.mkIf config.programs.zsh.enable ''
      # Yazi Shell 集成函数 - 支持目录跳转
      function yazi() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        command yazi "$@" --cwd-file="$tmp"
        IFS= read -r -d ''' cwd < "$tmp"
        [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
        rm -f -- "$tmp"
      }
      
      # 添加 Yazi 别名命令
      function y() { yazi "$@"; }
      function ya() { yazi "$@"; }
      function yz() { yazi "$@"; }
    '';

    programs.fish.interactiveShellInit = lib.mkIf config.programs.fish.enable ''
      # Yazi Shell 集成函数 - 支持目录跳转
      function yazi
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        command yazi $argv --cwd-file="$tmp"
        if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
          builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
      end
      
      # 添加 Yazi 别名命令
      function y
        yazi $argv
      end
      
      function ya
        yazi $argv
      end
      
      function yz
        yazi $argv
      end
    '';

    programs.nushell.extraConfig = lib.mkIf config.programs.nushell.enable ''
      # Yazi Shell 集成函数 - 支持目录跳转
      def --env yazi [...args] {
        let tmp = (mktemp -t "yazi-cwd.XXXXXX")
        ^yazi ...$args --cwd-file $tmp
        let cwd = (open $tmp)
        if $cwd != "" and $cwd != $env.PWD {
          cd $cwd
        }
        rm -fp $tmp
      }
      
      # 添加 Yazi 别名命令
      def --env y [...args] { yazi ...$args }
      def --env ya [...args] { yazi ...$args }
      def --env yz [...args] { yazi ...$args }
    '';
  };
}
