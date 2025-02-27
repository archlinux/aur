#!/bin/bash
REG_FILE="$HOME/.deepinwine/Deepin-WXWork/user.reg"

echo "正在清除旧的字体白名单..."
echo "Clearing old font whitelist..."
# 清除现有 whitelist 部分（从 [Software\Wine\Fonts\whitelist] 开始到下一个以 [ 开头的行或文件末尾）
sed -i '/^\[Software\\Wine\\Fonts\\whitelist\]/,/^\[/d' "$REG_FILE"

# 写入新的白名单头部到文件
{
    echo "[Software\\Wine\\Fonts\\whitelist] 123456789"
    echo "#time=1a2b3c4d5e6f"
} >> "$REG_FILE"

echo "正在扫描系统字体..."
echo "Scanning system fonts..."

# 扫描所有字体文件，并处理每个文件
find /usr/share/fonts/ -type f \( -iname "*.ttf" -o -iname "*.otf" -o -iname "*.ttc" -o -iname "*.otc" \) | while read -r font; do
    echo "处理文件: $font"
    echo "Processing file: $font"

    # 用 fc-query 提取字体家族名称（可能返回多行）
    fc_names=$(fc-query -f "%{family}\n" "$font" 2>/dev/null)
    if [ -z "$fc_names" ]; then
        echo "无法提取字体名称，跳过: $font"
        echo "Cannot extract font name, skipping: $font"
        continue
    fi

    # 根据文件扩展名判断字体类型
    extension=$(echo "$font" | awk -F. '{print tolower($NF)}')
    if [ "$extension" = "otf" ] || [ "$extension" = "otc" ]; then
        font_type="OpenType"
    else
        font_type="TrueType"
    fi

    # 将 Linux 字体文件路径转换为 Wine 格式（例如：Z:\\usr\\share\\fonts\\noto-cjk\\NotoSansCJK-Regular.ttc）
    wine_font_path=$(echo "$font" | sed 's|^/|Z:\\\\|; s|/|\\\\|g')

    # 对每个字体家族名称逐行处理
    while IFS= read -r fc_name; do
        # 去掉首尾空白
        fc_name=$(echo "$fc_name" | sed 's/^[[:space:]]*//; s/[[:space:]]*$//')
        [ -z "$fc_name" ] && continue

        # 将字体家族名称转换为 UTF-16LE 编码后，用 od 和 sed 格式化成 \xHH 形式
        font_hex=$(echo -n "$fc_name" | iconv -f UTF-8 -t UTF-16LE | od -An -vtx1 | tr -d ' \n' | sed 's/\(..\)/\\x\1/g')

        echo "生成注册表条目: $fc_name ($font_type) -> $wine_font_path"
        echo "Generating registry entry: $fc_name ($font_type) -> $wine_font_path"
        # 将注册表条目追加写入文件
        echo "\"$font_hex ($font_type)\"=\"$wine_font_path\"" >> "$REG_FILE"
    done <<< "$fc_names"
done

echo "字体白名单更新完成。"
echo "Font whitelist update complete."
