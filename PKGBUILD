# Maintainer: Debba <debba@example.com>
pkgname=storytel-player-bin
_pkgname=storytel-player
pkgver=1.3.0
pkgrel=1
pkgdesc="A cross-platform desktop application for playing Storytel audiobooks"
arch=('x86_64')
url="https://github.com/debba/storytel-player"
license=('custom')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('b058f16463c21b50b85208ee018c9ab7bfb4f49e00064faa222dbaaf0054eda1')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
