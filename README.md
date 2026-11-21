# unsloth-studio-rocm-gfx90a-updater

基于 [nvchecker](https://github.com/lilydjwg/nvchecker) 的定时更新检查/安装工具，针对 **Unsloth Studio（`~/.unsloth`）+ ROCm gfx90a** 技术栈。每天自动检查以下两个条目，有更新才动手：

| nvchecker 条目 | 检查来源 | 更新方式 |
|---|---|---|
| `pytorch_rocm` | AMD wheel 索引 `https://stable.repo.amd.com/rocm/whl-next/`（先取最新 ROCm 线，再取该线上最新 torch） | 重跑官方 install.sh 后，用 venv pip 钉装 `torch[device-gfx90a]` / `torchvision[device-gfx90a]` / `torchaudio`，并验证 `torch.cuda.is_available()`（任意模块触发更新时一并执行） |
| `unsloth` | PyPI（install.sh 实际安装来源） | 重跑官方 install.sh |

> **llama.cpp / whisper.cpp / audio.cpp 不在本包更新范围内。**实测它们的 release tarball 与 Studio 在 `~/.unsloth` 的落盘布局不一致（llama.cpp 是 `build/bin/` 叠加层 + 顶层软链 + 安装记录 json；whisper.cpp 的 `libggml.so.*` 与配套 llama.cpp 构建硬链接成对），整包替换会破坏可运行状态。这三个组件交给 Studio 自身的安装器管理。

## 安装后启用（用户级 timer，不自动开机启动）

```bash
systemctl --user enable --now unsloth-updater.timer   # 每天约 05:00 + 随机延迟
```

手动检查并应用：

```bash
/usr/lib/unsloth-updater/unsloth-updater.sh
```

日志：`journalctl --user -u unsloth-updater.service`；状态文件在 `~/.local/state/unsloth-updater/`（`oldver.json` 是"已安装版本"基线，`newver.json` 是本次探测结果）。

## 行为说明

- **首次运行**只记录基线不改动系统；之后每次只有 nvchecker 报告版本变化才会动手。
- **原子更新**：任意一个模块命中更新条件时，整个栈作为一个单元重新安装——统一重跑官方安装器（unsloth 组件），并且无论哪个模块触发更新，都统一执行 torch/torchvision/torchaudio 钉装与 `torch.cuda.is_available()` 验证；不会因为只触发了其中某一个模块而跳过另一个模块。
- 全部成功后才把 `newver.json` 提交为 `oldver.json`；任一步失败则不提交新基线，下一个 tick 整体重试整个栈（脚本不对磁盘做回滚，失败前的局部改动由重跑覆盖）。
- 每次栈更新都强制验证 `torch.cuda.is_available() is True`，不通过视为失败。
- 旧基线里遗留的 llama_cpp/whisper_cpp/audio_cpp 键不影响判断，脚本只看新探测结果。

## 环境变量开关

| 变量 | 作用 |
|---|---|
| `UNSLOTH_UPDATER_DRY_RUN=1` | 只检查并打印计划，不做任何修改 |
| `UNSLOTH_UPDATER_FORCE=1` | 首次运行也立即应用（默认首跑只记基线） |
| `UNSLOTH_UPDATER_CONFIG=<file>` | 自定义 nvchecker 配置（如加 GitHub token、改仓库） |
| `UNSLOTH_UPDATER_WHL_INDEX=<url>` | AMD wheel 索引地址（默认 gfx90a 的 whl-next） |

## 文件布局

- `/usr/lib/unsloth-updater/unsloth-updater.sh` — 主脚本
- `/usr/lib/unsloth-updater/amd_pytorch.py` — AMD 索引版本解析（nvchecker cmd source 调用）
- `/usr/share/unsloth-updater/nvchecker.toml` — 检查条目定义
- `/usr/lib/systemd/user/unsloth-updater.{service,timer}` — systemd 用户单元

> 注意：本包不经过 lilac 管理；更新的是 `~/.unsloth` 里 Studio 自己安装的组件，与系统 Python 无关。
