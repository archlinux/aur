# Maintainer: FerrousInk <ferrousink-aur@proton.me>

pkgname=twingate-installer
pkgver=1.0.0
pkgrel=1
pkgdesc="Automated installer for the official client"
arch=('x86_64')
url="https://twingate.com/"

prepare() {
   curl -o twingate.tar.zst https://binaries.twingate.com/client/linux/ARCH/x86_64/stable/twingate-amd64.pkg.tar.zst
   sudo pacman -U twingate.tar.zst --noconfirm --noprogressbar
}

package() {
   echo
}