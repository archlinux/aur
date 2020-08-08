#! /bin/bash
# Author: https://github.com/cytle/wechat_web_devtools/issues/293#issuecomment-604623774

set -e

if [ -z "$NW_PACKAGE_DIR" ]; then
    echo -e "\e[1;31m\$NW_PACKAGE_DIR is empty\e[0m" >&2
    exit 1
fi

cd "$NW_PACKAGE_DIR"
target_file=js/core/index.js

if [ ! -f "$target_file" ]; then
    echo -e "\e[1;31m$target_file is not exist\e[0m" >&2
    exit 1
fi

if [ "$(wc -l < "$target_file")" -gt 0 ]; then
    echo -e "\e[1;31m$target_file seems to have been modified\e[0m" >&2
    exit 1
fi

tmp_file=$(mktemp)
cat > "$tmp_file" <<EOF
const oldMenuAppend = nw.Menu.prototype.append
const oldMenuInsert = nw.Menu.prototype.insert
function isSeparator(menu_item) {
  return menu_item && menu_item.type === 'separator'
}
nw.Menu.prototype.append = function (menu_item) {
  const items = this.items
  const len = this.items.length
  if (~items.indexOf(menu_item)) return
  if (len === 0 && isSeparator(menu_item)) {
    return menu_item._destroy()
  }
  if (!isSeparator(menu_item) || !isSeparator(items[len - 1])) {
    oldMenuAppend.call(this, menu_item)
  } else {
    return menu_item._destroy()
  }
}
nw.Menu.prototype.insert = function (menu_item, i) {
  const items = this.items
  const len = this.items.length
  if (~items.indexOf(menu_item)) return
  if (len === 0 && isSeparator(menu_item)) {
    return menu_item._destroy()
  }
  if (!isSeparator(menu_item) || (!isSeparator(items[i]) && !isSeparator(items[i - 1]))) {
    oldMenuInsert.call(this, menu_item)
  } else {
    return menu_item._destroy()
  }
}
EOF
cat "$target_file" >> "$tmp_file"

cat "$tmp_file" > "$target_file"
rm "$tmp_file"
