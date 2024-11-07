# Maintainer: FerrousInk <ferrousink-aur@proton.me>

pkgname=twingate-installer
pkgver=2.0.0
pkgrel=2
pkgdesc="Automated installer for the official client"
arch=('x86_64')
url="https://twingate.com/"
source=("https://binaries.twingate.com/client/linux/ARCH/x86_64/stable/twingate-amd64.pkg.tar.zst")
sha256sums=('SKIP')

prepare() {
    sudo pacman -U twingate-amd64.pkg.tar.zst
    exit
}