{ config, lib, pkgs, ... }:

{
  config = lib.mkIf (config.mySystem.profiles.enable && config.mySystem.profiles.fonts.enable && config.mySystem.profiles.fonts.preset == "nordic") {
    fonts.packages = with pkgs; [
      # 主要字体 - 北欧简约风格
      inter                # 现代几何设计，简洁优雅
      source-sans-pro      # Adobe 清晰易读的无衬线字体
      work-sans            # 工作场景优化的简约字体
      

      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka
      nerd-fonts.sauce-code-pro
      nerd-fonts.roboto-mono
      nerd-fonts.hack
      nerd-fonts.caskaydia-mono      # Cascadia Code 的 nerd-fonts 版本
      nerd-fonts.ubuntu
      nerd-fonts.ubuntu-mono
      nerd-fonts.dejavu-sans-mono
      nerd-fonts.inconsolata-go
      nerd-fonts.space-mono
      nerd-fonts.droid-sans-mono
      nerd-fonts.meslo-lg
      nerd-fonts.anonymice
      nerd-fonts.liberation
      nerd-fonts.profont
      nerd-fonts.proggy-clean-tt
      nerd-fonts.go-mono
      nerd-fonts.agave
      
      monaspace           # GitHub 的现代编程字体
      source-code-pro     # Adobe 简洁编程字体
      roboto-mono         # Google 简约等宽字体
      jetbrains-mono      # JetBrains 专业编程字体
      fira-code           # Mozilla 连字编程字体
      
      # 衬线字体 - 优雅传统
      source-serif-pro     # Adobe 现代衬线字体
      crimson              # 优雅的阅读字体
      
      # 中文字体 - 简约现代
      lxgw-wenkai         # 霞鹜文楷，优雅的中文字体
      noto-fonts-cjk-sans # Google 现代中文
      source-han-sans     # Adobe 思源黑体
      source-han-serif    # Adobe 思源宋体
      sarasa-gothic       # 更纱黑体，编程友好
      
      # 系统基础字体和图标支持
      noto-fonts
      noto-fonts-emoji
      noto-fonts-extra
      liberation_ttf
      dejavu_fonts
      font-awesome        # Font Awesome 图标字体
      material-design-icons # Material Design 图标
      
      # 特色字体
      fira-sans
      ubuntu_font_family
    ];

    # 字体配置 - 北欧简约优化
    fonts.fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Source Serif Pro" "Source Han Serif SC" "LXGW WenKai" ];
        sansSerif = [ "Inter" "Work Sans" "Source Han Sans SC" "LXGW WenKai" ];
        monospace = [ 
          "JetBrains Mono Nerd Font" 
          "Fira Code Nerd Font"
          "Iosevka Nerd Font"
          "Source Code Pro Nerd Font"
          "Monaspace Neon" 
          "Sarasa Gothic SC" 
        ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
