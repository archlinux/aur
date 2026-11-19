# mihomo-party-ghproxy-git

从 [Clash Party](https://github.com/mihomo-party-org/clash-party)（原 Mihomo Party）的默认分支构建 Arch Linux 软件包。每次运行 `makepkg` 都会更新上游 Git 源码，版本号由构建时的提交生成。

```bash
makepkg -s
```

配置 HTTP 或 HTTPS 转发代理后，下载前会并行从 GitHub 直连和经代理各读取同一段 512 KiB 内容，优先用耗时更短的路线。实际 Git 下载失败时会切换路线。后续构建下载沿用 Git 下载成功时的路线。

```bash
MIHOMO_PARTY_GITHUB_PROXY=http://127.0.0.1:7890 makepkg -s
```

也可以用已有的 `https_proxy`、`HTTPS_PROXY`、`all_proxy` 或 `ALL_PROXY` 配置代理。未配置时走直连。显式设置 `MIHOMO_PARTY_GITHUB_PROXY=` 可指定直连。代理地址是 HTTP(S) 转发代理，示例端口需与本机代理客户端一致。

也可以从 [AUR](https://aur.archlinux.org/packages/mihomo-party-ghproxy-git) 获取配方。使用 AUR 助手时，如果构建进程继承了代理环境变量，同样会自动测速。
