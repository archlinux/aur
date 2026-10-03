#!/usr/bin/env bash
# typora-community-plugin 控制命令:
#   -h, --help 显示完整用法
#   sync       为当前用户创建共享插件链接
#   sync --all 为所有现有普通用户创建共享插件链接(需要 root)
#   reset      删除当前用户插件目录后重新创建链接(需要 --yes)
#   patch      向 Typora 的 window.html 注入 loader <script>(内部命令,需要 root)
#   unpatch    移除注入(内部命令,需要 root)
#
# 包内插件安装在 /usr/share,用户目录只保存符号链接和用户自己的插件/配置。
set -euo pipefail

PLUGIN_SOURCE='/usr/share/typora-community-plugin/plugins'
WINDOW_HTML='/usr/share/typora/resources/window.html'
MARKER='<script src="typora://app/userData/plugins/loader.js" type="module"></script>'

die() {
  printf 'typora-community-plugin: %s\n' "$*" >&2
  exit 1
}

_plugin_dir() {
  if [[ -n "${XDG_CONFIG_HOME:-}" && "$XDG_CONFIG_HOME" == /* ]]; then
    printf '%s/Typora/plugins' "$XDG_CONFIG_HOME"
  else
    printf '%s/.config/Typora/plugins' "$HOME"
  fi
}

_link_source_tree() {
  local dest="$1"
  local source name target

  [[ -d "$PLUGIN_SOURCE" ]] || {
    printf 'typora-community-plugin: 共享插件源不存在:%s\n' \
      "$PLUGIN_SOURCE" >&2
    return 1
  }
  install -d -m 755 "$dest"

  shopt -s nullglob
  for source in "$PLUGIN_SOURCE"/*; do
    name="${source##*/}"
    target="$dest/$name"
    if [[ -L "$target" && "$(readlink "$target")" == "$source" ]]; then
      continue
    fi
    if [[ -e "$target" || -L "$target" ]]; then
      printf 'typora-community-plugin: 保留现有文件 %s\n' "$target"
      continue
    fi
    ln -s "$source" "$target"
  done
  shopt -u nullglob
}

_require_user() {
  [[ $EUID -ne 0 ]] ||
    die 'sync/reset 必须以使用 Typora 的普通用户执行'
}

_require_root() {
  [[ $EUID -eq 0 ]] ||
    die 'sync --all/patch/unpatch 必须以 root 执行'
}

_sync_current_user() {
  _require_user
  _link_source_tree "$(_plugin_dir)"
  printf 'typora-community-plugin: 已为当前用户创建共享插件链接\n'
}

_sync_all_users() {
  _require_root

  local user _ uid gid _ _ home _
  local dest
  while IFS=: read -r user _ uid gid _ _ home _; do
    [[ "$uid" =~ ^[0-9]+$ ]] || continue
    (( uid >= 1000 && uid < 60000 )) || continue
    [[ -d "$home" ]] || continue

    dest="$home/.config/Typora/plugins"
    if ! install -d -m 755 -o "$uid" -g "$gid" "$dest"; then
      printf 'typora-community-plugin: 无法创建 %s,跳过用户 %s\n' \
        "$dest" "$user" >&2
      continue
    fi
    if ! chown "$uid:$gid" "$dest"; then
      printf 'typora-community-plugin: 无法设置 %s 属主,跳过用户 %s\n' \
        "$dest" "$user" >&2
      continue
    fi
    if ! _link_source_tree "$dest"; then
      printf 'typora-community-plugin: 无法同步用户 %s\n' "$user" >&2
      continue
    fi
    printf 'typora-community-plugin: 已为用户 %s 创建共享插件链接\n' "$user"
  done < <(getent passwd)
}

cmd_sync() {
  if [[ "${2:-}" == '--all' ]]; then
    [[ "${1:-}" == 'sync' ]] || die '内部参数错误'
    _sync_all_users
  else
    _sync_current_user
  fi
}

cmd_reset() {
  _require_user
  [[ "${2:-}" == '--yes' ]] ||
    die 'reset 会删除当前用户的插件和配置,确认后使用: reset --yes'

  local dest
  dest="$(_plugin_dir)"
  [[ "$dest" == */Typora/plugins ]] ||
    die "插件目录路径异常:$dest"
  rm -rf "$dest"
  _link_source_tree "$dest"
  printf 'typora-community-plugin: 当前用户插件目录已清除并重建\n'
}

cmd_patch() {
  _require_root
  if [[ ! -f "$WINDOW_HTML" ]]; then
    echo "typora-community-plugin: 未见 $WINDOW_HTML(typora 未安装),跳过注入"
    return 0
  fi
  grep -qF "$MARKER" "$WINDOW_HTML" && return 0

  local count
  count="$(grep -oF '</body>' "$WINDOW_HTML" | wc -l)"
  [[ "$count" -eq 1 ]] ||
    die "$WINDOW_HTML 内 </body> 出现 $count 次(预期 1 次),未注入"

  sed -i "s|</body>|${MARKER}</body>|" "$WINDOW_HTML"
  echo "typora-community-plugin: 已向 $WINDOW_HTML 注入 loader 脚本"
}

cmd_unpatch() {
  _require_root
  [[ -f "$WINDOW_HTML" ]] || return 0
  grep -qF "$MARKER" "$WINDOW_HTML" || return 0
  sed -i "s|${MARKER}||" "$WINDOW_HTML"
  echo "typora-community-plugin: 已从 $WINDOW_HTML 移除 loader 脚本"
}

cmd_help() {
  cat <<'EOF'
用法:
  typora-community-plugin -h|--help
  typora-community-plugin sync
  typora-community-plugin reset --yes

说明:
  sync
      为当前用户创建 ~/.config/Typora/plugins/ 下的共享插件链接。
      用户自己安装的插件和配置不会被覆盖。

  reset --yes
      删除当前用户的 Typora 插件目录和其中的用户数据,
      然后重新创建共享插件链接。此操作不可恢复。

安装脚本内部命令:
  typora-community-plugin sync --all
      为所有现有普通用户创建共享插件链接。
  typora-community-plugin patch
      向 Typora 的 window.html 注入 loader。
  typora-community-plugin unpatch
      移除 loader 注入。

升级旧版本:
  修复版本会自动备份旧版用户数据并自动应用新版插件。
  pacman 输出迁移提示后,按提示手动执行 cp 命令即可。
EOF
}

case "${1:-}" in
-h|--help|help) cmd_help ;;
sync) cmd_sync "$@" ;;
reset) cmd_reset "$@" ;;
patch) cmd_patch ;;
unpatch) cmd_unpatch ;;
*) die "未知命令:$1 (使用 typora-community-plugin --help 查看用法)" ;;
esac
