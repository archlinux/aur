# Bazi-cli

**A traditional Chinese fortune-telling CLI program based on the Eight Characters (Bazi). 中文命令行算命程序（基于八字）**

## 📜 项目简介

这是一个基于中国传统命理学“八字”原理开发的命令行程序，支持输入出生年月日时进行八字排盘与简要分析。适合对传统文化感兴趣的用户使用。

> 🌟 本项目适合具备基本中文阅读能力的用户，需在支持中文显示的终端中运行。

## 🧰 功能特点

- 输入公历出生日期和时间
- 自动换算为农历与天干地支信息
- 排出八字（年柱、月柱、日柱、时柱）
- 未来扩展：流年分析、大运分析、五行分布

## 📦 安装方式

需已安装 [Rust](https://www.rust-lang.org/) 工具链：

```bash
git clone git@github.com:Paul-sinbud2004/Bazi-cli.git
cd Bazi-cli
cargo build --release

或直接运行：

cargo run
```

## 🚀 使用方式

./target/release/bazi-cli

根据提示输入出生信息（例如：1990年5月20日 14时），程序将返回对应八字命盘。
## 📋 运行环境

    Linux

    Rust 版本：1.70 或以上

    终端必须支持中文字体显示，建议使用支持 UTF-8 的终端模拟器。

## 🔮 示例输出

请输入出生日期（格式：YYYY-MM-DD）：
1990-05-20
请输入出生时间（24小时制，格式：HH）：
14

农历：庚午年 四月 廿六日 未时
八字：庚午 丁巳 丙申 己未

## 📖 后续计划

增加命理解释模块

添加流年与大运分析

提供更友好的输出格式（如彩色终端或 Web 版）
