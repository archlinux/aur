#!/usr/bin/sh
# DLAGENT for Lark's US license (see first 16. Supplemental paragraph in normal ToS)

output="$1"
url="$2"
curl -L "$url" > "$output"

license_content=$(sed -n 's/.*window\._templateValue = \(.*\);.*/\1/p' "$output" | \
    sed -n 's/.*"html":"\(.*\)","content.*/\1/p' | head -1 | \
# Unescape <>, ", /, \n
    sed 's/\\u003c/</g; s/\\u003e/>/g; s/\\"/"/g; s/\\\//\//g; s/\\n/\n/g' | \
# Remove junk Hera class, id, data-*, style, and dir attributes
    sed 's/ class="[^"]*"//g; s/ id="[^"]*"//g; s/ data-[^=]*="[^"]*"//g; s/ style="[^"]*"//g; s/ dir="auto"//g; s/ data-[^=]*="[^"]*"//g')

# Surround extracted content in metadata hardcoded from the original to make valid HTML
cat > "$output" << EOF
<!DOCTYPE html>
<html lang="en_us">
<head>
<meta charset="utf-8" >
<meta name="title" content="U.S. User Terms of Service">
<meta name="description" content="U.S. User Terms of Service">
<meta name="keywords" content="">
</head>
<body>
$license_content
</body>
</html>
EOF
