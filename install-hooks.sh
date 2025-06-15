#!/bin/sh

cd .git/hooks

# https://gist.github.com/ansemjo/fbffb97ac95bfacac904785d36fc81a8
cat << 'EOF' > pre-commit
#!/bin/sh
set -e
# update SRCINFO before committing
if [ "$(git config --bool aur.hook.srcinfo)" != "false" ]; then
  echo "aur.hook.srcinfo: updating .SRCINFO ..."
  makepkg --printsrcinfo > .SRCINFO
  git add .SRCINFO
fi
EOF
chmod +x pre-commit
