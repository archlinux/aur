# Maintainer: Mathis Paquet <mathispaquet362@gmail.com>
pkgname=linkora-bin
pkgver=0.16.0
_desktopver=1.0.14-1
pkgrel=3
pkgdesc="Link organizer for Android and desktop with self-hosted sync"
arch=(x86_64)
url="https://github.com/LinkoraApp/Linkora"
license=('MIT')
depends=('xdg-utils')
options=('!debug')
install=linkora.install
source=("https://github.com/LinkoraApp/Linkora/releases/download/release-v${pkgver}/linkora_${_desktopver}_amd64.deb")
sha256sums=('20d953c2e92bf47a0c4618a00ab8c0d4dc9fbeba8cf753af37ff1c6a3bdb6840')

package() {
    bsdtar -xf data.tar.zst -C ${pkgdir}
}
