# Maintainer: Mathis Paquet <mathispaquet362@gmail.com>
pkgname=linkora-bin
pkgver=0.15.1
_desktopver=1.0.13-1
pkgrel=2
pkgdesc="Link organizer for Android and desktop with self-hosted sync"
arch=(x86_64)
url="https://github.com/LinkoraApp/Linkora"
license=('MIT')
depends=('xdg-utils')
options=('!debug')
install=linkora.install
source=("https://github.com/LinkoraApp/Linkora/releases/download/release-v${pkgver}/linkora_${_desktopver}_amd64.deb")
sha256sums=('975faeb8f12a22227497d8f73ad8ad45e18817c403125c2d90eda6ac134272a0')

package() {
    bsdtar -xf data.tar.zst -C ${pkgdir}
}
