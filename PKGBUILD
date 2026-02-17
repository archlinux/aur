# Maintainer: Debba <debba@example.com>
pkgname=storytel-player-bin
_pkgname=storytel-player
pkgver=1.2.8
pkgrel=1
pkgdesc="A cross-platform desktop application for playing Storytel audiobooks"
arch=('x86_64')
url="https://github.com/debba/storytel-player"
license=('custom')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('e0c6c134fa592948f794c2462fd83e745804b90059f552fd23c8b1f31d51c100')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
