#!/usr/bin/sh
# DLAGENT for Lark's license

output="$1"
url="$2"
curl -L "$url" > "$output"

# Extract HTML from non-mobile heraData in the scripted JSON; heraMobileData currently duplicates the same content
license_content=$(sed -n '/^.*heraData:/,/^.*heraMobileData:/{ s/.*"html":"\(.*\)","title.*/\1/p; }' "$output" | head -1 | \
# Unescape <>, ", /, \n
    sed 's/\\u003c/</g; s/\\u003e/>/g; s/\\"/"/g; s/\\\//\//g; s/\\n/\n/g' | \
# Remove junk Hera class, id, data-*, style, and dir attributes
    sed 's/ class="[^"]*"//g; s/ id="[^"]*"//g; s/ data-[^=]*="[^"]*"//g; s/ style="[^"]*"//g; s/ dir="auto"//g')

# Surround extracted content in metadata hardcoded from the original to make valid HTML
cat > "$output" << EOF
<!DOCTYPE html>
<html lang="en_us">
  <head>
    <title>User Terms of Service | Lark</title>
    <meta charset="UTF-8" />
    <meta name="title" content="User Terms of Service | Lark" />
    <meta name="keywords" content="Lark User Terms of Service" />
    <meta name="description" content="Lark User Terms of Service" />
  </head>
  <body>
$license_content
  </body>
</html>
EOF
