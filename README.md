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

## 更新 pkgver

仓库附带 `update-pkgver.sh` 脚本与 [nvchecker](https://github.com/archlinux/nvchecker) 配置。在包目录内运行：

```sh
./update-pkgver.sh
```

脚本会通过 nvchecker 检测最新版本（stable 或 pre-release，取较新者；`-test` 标签已被排除），若有新版本则更新 `pkgver`、重置 `pkgrel=1`、刷新校验和（`updpkgsums` 会重新下载 `.deb` 计算 SHA256）并重建 `.SRCINFO`，最后打印 `git diff`。需要 `nvchecker makepkg updpkgsums jq`（安装 `nvchecker` 与 `jq`）。

仅查看而无需修改文件时：

```sh
nvchecker -c .nvchecker.toml
```

`.nvchecker.toml` 将标签限定为 stable + pre-release，并以 `pkgver` 形式输出：

```
bettbox-compatible: updated to 1.18.9pre1
```

> 注意：AUR 提交使用 stable 版本；pre-release 仅用于本地构建测试。

## 致谢

[flclash-bin](https://aur.archlinux.org/packages/flclash-bin)

## 许可证

- 本项目 (打包脚本) 使用 [MIT](LICENSE) 许可
 
- [上游](https://github.com/appshubcc/Bettbox)使用 [GPL-3.0-or-lator](https://www.gnu.org/licenses/gpl-3.0.html) 许可