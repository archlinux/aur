find . -maxdepth 1 -mindepth 1 -not \( -name "PKGBUILD" -or -name ".SRCINFO" -or -name ".git" -or -name ".gitignore" -or -name "clean.sh" \) -exec rm -rf "{}" \;
