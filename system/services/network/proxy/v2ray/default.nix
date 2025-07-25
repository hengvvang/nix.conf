{ config, lib, pkgs, ... }:

{
    imports = [
        ./v2ray.nix
    ];
    
    options.mySystem.services.network.proxy.v2ray = {
        enable = lib.mkEnableOption "V2ray 代理支持";
        
        package = lib.mkOption {
            type = lib.types.package;
            default = pkgs.v2ray;
            description = "使用的 v2ray 包";
        };
        
        config = lib.mkOption {
            type = lib.types.nullOr lib.types.attrs;
            default = null;
            description = "V2ray 配置对象";
        };
        
        configFile = lib.mkOption {
            type = lib.types.nullOr lib.types.path;
            default = null;
            description = "V2ray 配置文件的绝对路径";
        };
    };
}
