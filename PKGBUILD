# Maintainer: Debba <debba@example.com>
pkgname=storytel-player-bin
_pkgname=storytel-player
pkgver=1.4.0
pkgrel=1
pkgdesc="A cross-platform desktop application for playing Storytel audiobooks"
arch=('x86_64')
url="https://github.com/debba/storytel-player"
license=('custom')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('68688d9c0baacb2aebb8383cf5e140a18f6980ca00fb1a141041066e3cdff643')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
