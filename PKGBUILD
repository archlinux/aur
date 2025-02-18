# Maintainer: Your Name <claudemods101@gmail.com>
pkgname=apexisocreatorscript
pkgver=1.0
pkgrel=1
pkgdesc="Arch ISO creator script (pre-compiled)"
arch=('x86_64')
url="https://github.com/claudemods/ApexArchIsoCreatorScriptAppImage"
license=('GPL')
depends=(
  'arch-install-scripts' 'bash-completion' 'dosfstools' 'erofs-utils' 'findutils' 'git' 'grub' 'jq' 'libarchive'
  'libisoburn' 'lsb-release' 'lvm2' 'mkinitcpio-archiso' 'mkinitcpio-nfs-utils' 'mtools' 'nbd' 'pacman-contrib'
  'parted' 'procps-ng' 'pv' 'python' 'rsync' 'sshfs' 'syslinux' 'xdg-utils' 'zsh-completions' 'kernel-modules-hook'
  'virt-manager' 'kate' 'konsole' 'squashfs-tools'
)
source=("git+https://github.com/claudemods/ApexArchIsoCreatorScriptAppImage.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/ApexArchIsoCreatorScriptAppImage"
  install -Dm755 "apexisocreatorscript" "$pkgdir/usr/bin/apexisocreatorscript"
  install -Dm644 "apexisocreatorscript.desktop" "$pkgdir/usr/share/applications/apexisocreatorscript.desktop"
  install -Dm644 "pirate-ship.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/pirate-ship.png"
}
