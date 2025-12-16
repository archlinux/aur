# Maintainer: Mathis Paquet <mathispaquet362@gmail.com>
pkgname=linkora-bin
pkgver=0.14.0
_desktopver=1.0.11-1
pkgrel=1
pkgdesc="Link organizer for Android and desktop with self-hosted sync"
arch=(x86_64)
url="https://github.com/LinkoraApp/Linkora"
license=('MIT')
options=('!debug')
install=linkora.install
source=("https://github.com/LinkoraApp/Linkora/releases/download/release-v${pkgver}/linkora_${_desktopver}_amd64.deb")
sha256sums=('a589e805512f01b46e51581ac2e7b6262fab7629ac8e0cce5e968f6dfb6c9844')

package() {
    bsdtar -xf data.tar.zst -C ${pkgdir}
}
