curl -s 'https://api.github.com/repos/drone/drone-cli/releases/latest' | \
jq -r .tag_name | \
sed 's|v||'
