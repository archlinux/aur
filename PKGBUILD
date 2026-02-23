# Maintainer: Debba <debba@example.com>
pkgname=storytel-player-bin
_pkgname=storytel-player
pkgver=1.2.10
pkgrel=1
pkgdesc="A cross-platform desktop application for playing Storytel audiobooks"
arch=('x86_64')
url="https://github.com/debba/storytel-player"
license=('custom')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('f5bfb420a8d489d23eb224f49c4be461c5e601fc37f2db220ec3c5324f51a815')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
