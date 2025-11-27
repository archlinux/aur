# LeetCode FSRS CLI

基于FSRS（Free Spaced Repetition Scheduler）记忆算法的LeetCode刷题CLI工具，通过科学的间隔重复算法帮助你高效刷题。

[![AUR](https://img.shields.io/aur/version/leetcode-fsrs-cli)](https://aur.archlinux.org/packages/leetcode-fsrs-cli)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

## 🚀 快速开始

### 安装

#### Arch Linux (AUR)

**源码版** (推荐开发者)
```bash
# 使用 paru
paru -S leetcode-fsrs-cli

# 或使用 yay
yay -S leetcode-fsrs-cli
```

**二进制版** (零依赖，推荐普通用户)
```bash
# 使用 paru
paru -S leetcode-fsrs-cli-bin

# 或使用 yay
yay -S leetcode-fsrs-cli-bin
```

**版本对比**:
- **源码版** (`leetcode-fsrs-cli`): 需要安装 `python-click` 和 `python-requests` 依赖
- **二进制版** (`leetcode-fsrs-cli-bin`): 完全独立，无需安装任何Python包

#### 从源码安装
```bash
# 克隆仓库
git clone https://github.com/SaintFore/LeetCodeCLI.git
cd LeetCodeCLI

# 安装包 (会自动安装依赖)
pip install .

# 或开发模式安装
pip install -e .
```

**注意**: 当前GitHub仓库名为 `LeetCodeCLI`，但包名为 `leetcode-fsrs-cli`

### 使用方法

```bash
# 1. 初始化项目
leetcode-fsrs init

# 2. 开始练习
leetcode-fsrs practice

# 3. 查看统计
leetcode-fsrs stats
```

## 📋 命令列表

| 命令 | 说明 | 示例 |
|------|------|------|
| `init` | 初始化项目 | `leetcode-fsrs init` |
| `practice` | 开始练习 | `leetcode-fsrs practice --limit 20` |
| `stats` | 显示统计 | `leetcode-fsrs stats` |
| `schedule` | 复习计划 | `leetcode-fsrs schedule` |
| `list` | 列出题目 | `leetcode-fsrs list --difficulty easy` |
| `search` | 搜索题目 | `leetcode-fsrs search "binary"` |
| `add` | 添加题目 | `leetcode-fsrs add 1 "Two Sum" easy "array,hash-table"` |

## 🧠 FSRS算法

FSRS（Free Spaced Repetition Scheduler）是一种基于记忆模型的间隔重复算法：

- **科学记忆**: 根据记忆稳定性计算最优复习间隔
- **自适应学习**: 根据用户表现调整复习频率
- **长期记忆**: 优化长期记忆保留效果

### 评分系统
在练习时，根据回忆难度给出1-5分：

- **1**: 完全忘记
- **2**: 很困难
- **3**: 中等难度
- **4**: 简单
- **5**: 完美掌握

## 📊 数据存储

- **数据目录**: `~/.config/leetcode-fsrs-cli/`
- **题目数据**: `questions.json`
- **复习记录**: `reviews.json`
- **用户配置**: `config.json`

## 🔧 配置选项

编辑 `~/.config/leetcode-fsrs-cli/config.json` 自定义设置：

```json
{
    "daily_review_limit": 20,
    "auto_update_due": true,
    "show_progress_bar": true,
    "language": "zh"
}
```

## 🐛 故障排除

### 常见问题

**Q: 命令找不到**
A: 确保包已正确安装，检查Python环境

**Q: 数据目录权限问题**
A: 确保对 `~/.config/` 有写权限

**Q: 练习时没有题目**
A: 确保已运行 `leetcode-fsrs init` 并添加题目

### 调试信息

```bash
# 检查安装
which leetcode-fsrs

# 检查数据目录
ls -la ~/.config/leetcode-fsrs-cli/

# 查看详细帮助
leetcode-fsrs --help
```

## 🤝 贡献

欢迎提交Issue和Pull Request来改进这个项目！

## 📄 许可证

MIT License - 详见 [LICENSE](LICENSE) 文件

## 🙏 致谢

- FSRS算法: [open-spaced-repetition/fsrs4anki](https://github.com/open-spaced-repetition/fsrs4anki)
- LeetCode: 提供优质的算法题目

---

**开始你的高效刷题之旅！** 🚀