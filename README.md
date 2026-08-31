# bazi-cli (AUR)

命理精研（destiny_cn）AUR 包名沿用旧版 `bazi-cli`，但实际是 PyQt6 图形桌面应用。

## 安装

```bash
yay -S bazi-cli
```

## 功能

- **八字详盘**：四柱、十神、藏干、纳音、大运流年
- **紫微斗数**：十二宫、五行局、四化、大限（闰月可派别切换）
- **黄大仙灵签**：完整一百签
- **周易六十四卦**：时间起卦 / 铜钱摇卦 / 查卦
- **自定义字体**：自动探测系统已安装的中文字体（修复 Linux 中文显示模糊问题），支持自由选择字体与字号，全局生效、自动持久化
- **本地历史记录**：排盘 / 求签 / 起卦结果自动保存本机（不上传云端），一键回填档案并复现完整结果

## 命令

- `destiny_cn`：新命令名（推荐）
- `bazi-cli`：旧版命令名兼容符号链接（指向 `destiny_cn`）

## 来源

[GitHub: Paul-sinbud2004/Bazi-cli](https://github.com/Paul-sinbud2004/Bazi-cli)

旧版 Rust CLI 保留在 `legacy-v1-rust` 分支（v1.0.0）。