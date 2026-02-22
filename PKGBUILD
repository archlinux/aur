# Maintainer: Debba <debba@example.com>
pkgname=storytel-player-bin
_pkgname=storytel-player
pkgver=1.2.9
pkgrel=1
pkgdesc="A cross-platform desktop application for playing Storytel audiobooks"
arch=('x86_64')
url="https://github.com/debba/storytel-player"
license=('custom')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('3c11311f22a3f7001d8a8cc7c062f5c292f62b061e1bdddd19ae9a35eb5d9eea')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
