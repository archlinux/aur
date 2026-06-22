# bettbox-compatible-bin

Bettbox 是一款使用 Mihomo (Clash Meta) 内核、基于 FlClash 早期版本进行重构的多平台代理客户端

基于 [appshubcc/Bettbox](https://github.com/appshubcc/Bettbox) 的 Arch Linux AUR 包。

compatible 包基于 `GOAMD64=v1` 参数构建，兼容部分[旧CPU](https://go.dev/wiki/MinimumRequirements#amd64)

## 安装

```sh
# 手动构建
makepkg -si

# 或通过 AUR helper
paru -S bettbox-compatible-bin
```

## 致谢

[flclash-bin](https://aur.archlinux.org/packages/flclash-bin)

## 许可证

- 本项目 (打包脚本) 使用 [MIT](LICENSE) 许可
 
- [上游](https://github.com/appshubcc/Bettbox)使用 [GPL-3.0-or-lator](https://www.gnu.org/licenses/gpl-3.0.html) 许可