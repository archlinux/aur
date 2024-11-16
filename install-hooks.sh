#!/bin/bash
# 安装 Git 钩子
cp pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
echo "Git hooks installed successfully."
