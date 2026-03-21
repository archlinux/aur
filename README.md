# GSET AUR Package - Ready to Upload
# 
# This package is configured and ready for AUR upload.
# Follow these steps to upload:

## Option 1: Using yay (recommended)

yay --sudoloop -Syu gset-git

# This will:
# 1. Check if package exists on AUR
# 2. If not, offer to create it
# 3. Upload PKGBUILD and related files

## Option 2: Manual AUR Upload

1. Go to https://aur.archlinux.org/account and log in

2. Add SSH key to AUR (if not already):
   - Account Settings → SSH Keys

3. Clone the package repo (or create new):
   git clone ssh://aur@aur.archlinux.org/gset-git.git

4. Copy PKGBUILD and files:
   cp packages/aur/* /path/to/gset-git/
   cp gset.conf gset.lang/LICENSE .

5. Commit and push:
   cd gset-git
   git add .
   git commit -m "GSET v2.0.2 - CC BY-NC 4.0"
   git push origin master

## To test locally first:
cd packages/aur
makepkg -s
# Install: sudo pacman -U gset-git-*.pkg.tar.zst