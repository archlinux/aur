curl -s 'https://downloads.zohocdn.com/zmail-desktop/artifacts.json' | \
jq -r .linux.primary.x64 | \
sed 's|https://downloads.zohocdn.com/zmail-desktop/linux/zoho-mail-desktop-x64-v||g' | \
sed 's|.AppImage||g'
