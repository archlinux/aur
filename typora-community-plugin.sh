#!/usr/bin/env bash
# typora-community-plugin 控制命令(由包安装脚本与 pacman hook 调用,也可手动执行):
#   patch    向 Typora 的 window.html 注入 loader <script>(幂等)
#   unpatch  移除注入(卸载时还原 window.html)
#   own      把插件目录属主改为目标用户 —— 插件市场要在该目录写入新插件
#
# 注入的标记与上游 install-linux.sh 完全一致,所以手动装过的环境不会重复注入,
# 卸载也能原样清理。
set -euo pipefail

# 构建时固化为 Typora userData 的 plugins 目录(<XDG 配置目录>/Typora/plugins)
PLUGIN_DIR='__PLUGIN_DIR__'
WINDOW_HTML='/usr/share/typora/resources/window.html'
MARKER='<script src="typora://app/userData/plugins/loader.js" type="module"></script>'

die() {
  printf 'typora-community-plugin: %s\n' "$*" >&2
  exit 1
}

# 推断插件目录所属用户:sudo 调用者优先,其次看目录属主(均为用户自己创建的目录)
_target_user() {
  local home candidate
  home="$(dirname "$(dirname "$PLUGIN_DIR")")"
  if [[ -n "${SUDO_USER:-}" ]] &&
    [[ "$(getent passwd "$SUDO_USER" | cut -d: -f6)" == "$home" ]]; then
    printf '%s' "$SUDO_USER"
    return 0
  fi
  for candidate in "$(dirname "$PLUGIN_DIR")" "$home"; do
    if [[ -d "$candidate" ]]; then
      stat -c %U "$candidate"
      return 0
    fi
  done
  return 1
}

cmd_patch() {
  if [[ ! -f "$WINDOW_HTML" ]]; then
    echo "typora-community-plugin: 未见 $WINDOW_HTML(typora 未安装),跳过注入"
    return 0
  fi
  grep -qF "$MARKER" "$WINDOW_HTML" && return 0

  # 上游结构变化时宁可报错,也不把脚本插到错误位置
  local count
  count="$(grep -oF '</body>' "$WINDOW_HTML" | wc -l)"
  [[ "$count" -eq 1 ]] ||
    die "$WINDOW_HTML 内 </body> 出现 $count 次(预期 1 次),未注入"

  sed -i "s|</body>|${MARKER}</body>|" "$WINDOW_HTML"
  echo "typora-community-plugin: 已向 $WINDOW_HTML 注入 loader 脚本"
}

cmd_unpatch() {
  [[ -f "$WINDOW_HTML" ]] || return 0
  grep -qF "$MARKER" "$WINDOW_HTML" || return 0
  sed -i "s|${MARKER}||" "$WINDOW_HTML"
  echo "typora-community-plugin: 已从 $WINDOW_HTML 移除 loader 脚本"
}

cmd_own() {
  [[ -d "$PLUGIN_DIR" ]] || return 0
  local user
  user="$(_target_user)" || {
    echo "typora-community-plugin: 无法确定 $PLUGIN_DIR 的目标用户,跳过属主修正"
    return 0
  }
  chown -R "${user}:$(id -gn "$user")" "$PLUGIN_DIR"
  echo "typora-community-plugin: $PLUGIN_DIR 属主已设为 $user"
}

case "${1:-}" in
patch) cmd_patch ;;
unpatch) cmd_unpatch ;;
own) cmd_own ;;
*) die "用法:typora-community-plugin {patch|unpatch|own}" ;;
esac
