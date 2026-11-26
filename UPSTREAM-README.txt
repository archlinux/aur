《蓝色星原：旅谣》临时兼容修复版 —— 仅用于临时运行
==================================================

这两个 .so 是打补丁重新构建的 Wine Unix 驱动（基于 dwproton 11.0-17 / Wine 11.0），
用于在官方 dwproton 修复相关问题之前临时运行《蓝色星原：旅谣》(Azur Promilia)：

  win32u.so     SetParent -> owner 转换（保留分层窗口的 ARGB X window）
  winex11.so    让游戏 SDK 的分层工具弹窗保持 unmanaged（不被 WM 压回 640x480）

安装：把它们复制到 <兼容工具>/files/lib/wine/x86_64-unix/，chmod 555，
      原文件请先备份（scripts/install.sh 会自动备份）。

⚠️ 这是临时过渡版本，不是官方发行版：
   一旦 dwproton 官方版本（或 Wine 上游）包含等价修复，请移步官方 dwproton，
   停止使用本补丁二进制。

许可：Wine 的衍生物，LGPL-2.1-or-later（完整文本见仓库根目录 LICENSE，摘要见 NOTICE.md）。
