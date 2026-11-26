# dwproton-binfmt

让内核把 Windows 可执行文件（PE/EXE）**永久**交给 `dwproton` 启动。

解决的问题：`binfmt_misc` 的注册是运行时状态，重启就没了；而 `/usr/lib/binfmt.d/wine.conf`
属于 `wine` 包——一旦卸掉 wine，连这条也没了。本包把「指向 dwproton」的注册写成配置文件，
由 `systemd-binfmt.service` 在每次开机时重新注册。

## 只有一个 DOSWin

注册名固定为 `DOSWin`，wine 和 dwproton 只能有一个占着它。所以本包直接声明
`conflicts=('wine')`：不想用「遮蔽 wine 的配置文件」那种半吊子做法，而是让 pacman 保证
「机器上只有一个 binfmt 主人」。注意 `conflicts` 匹配 `provides`，因此 wine-staging、
wine-cachyos、wine-dwproton-bin 这些「提供 wine 的包」同样会冲突——它们本来也互斥。

## 装

先清掉依赖 wine 的包（pacman 会按依赖顺序拦住你，这些都得先走）：

```bash
sudo pacman -Rns wine-hoyo-stub dxvk-mingw-git   # 有装则删；Proton 自带 dxvk，不需要它
sudo pacman -Rns wine-mono wine-gecko            # wine 的 .NET/HTML 组件，用了 dwproton 就不需要
sudo pacman -Rns wine
sudo pacman -U dwproton-binfmt-1-1-any.pkg.tar.zst
```

装完应当看到：

```
  -> binfmt: DOSWin -> /usr/bin/dwproton （已生效，重启后仍有效）
```

## 验证

```bash
cat /proc/sys/fs/binfmt_misc/DOSWin      # interpreter 一行应为 /usr/bin/dwproton
./某个程序.exe                            # 直接执行，不再需要 wine 前缀命令
```

重启后再看一次 `cat /proc/sys/fs/binfmt_misc/DOSWin`，仍在即持久化成功。

## 它做了什么

| 文件 | 作用 |
| --- | --- |
| `/usr/lib/binfmt.d/dwproton.conf` | `:DOSWin:M::MZ::/usr/bin/dwproton:`，按 PE 魔数 `MZ` 匹配 |
| `.install` | 安装/升级时先 `echo -1 > /proc/sys/fs/binfmt_misc/DOSWin` 撤销残留注册（刚卸掉的 wine 会留下一条），再 `systemctl restart systemd-binfmt`；站点自检并打印结果 |
| `conflicts=('wine')` | 保证它和任何 wine 提供者不会同时装 |

`dwproton` 来自 `dwproton-launcher`（依赖已声明），它会带上 Proton 的环境：
`STEAM_COMPAT_DATA_PATH`（默认 `~/.local/share/proton-pfx/<appid>`）、dxvk 相关变量等。

## 和桌面双击的关系

桌面双击 **不依赖本包**：`dwproton.desktop` 已经注册了
`application/x-ms-dos-executable;application/x-msi;application/x-ms-shortcut;application/x-bat;application/x-mswinurl`。
本包补的是另一条入口：终端里 `./x.exe`、以及其它程序直接 `execve()` 一个 exe 的场景。

## 不想用包？

等价于两条命令（注意此时 wine 必须已经删掉，否则两个 `DOSWin` 打架）：

```bash
echo ':DOSWin:M::MZ::/usr/bin/dwproton:' | sudo tee /usr/lib/binfmt.d/dwproton.conf
sudo sh -c '[ -e /proc/sys/fs/binfmt_misc/DOSWin ] && echo -1 > /proc/sys/fs/binfmt_misc/DOSWin; systemctl restart systemd-binfmt'
```

包的价值只是：卸载时能干净地还回去、升级时自动重注册、以及能被 `pacman -Ql` 看见。

## 卸载

```bash
sudo pacman -R dwproton-binfmt
```

会把注册撤销；之后想用 wine，装回来即可（它的 `wine.conf` 在下次开机或 `systemctl restart systemd-binfmt` 时生效）。

## 注意

- `dwproton` 跑日常程序会套上 Proton 环境（`protonfixes` 按 UNKNOWN(0) 处理），这是选择它的代价，不是本包的。
- 如果你只是想「临时让终端里的 exe 走 dwproton，但 wine 留着」，本包不适用——那种情况下两个 `DOSWin` 必然有一个静默失效，不如不装。
