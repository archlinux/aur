# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=wl-clipboard-x11
pkgver=4
pkgrel=1
pkgdesc='A wrapper to use wl-clipboard as a drop-in replacement to X11 clipboard tools'
url='https://github.com/brunelli/wl-clipboard-x11'
license=('GPL')
arch=('any')
depends=('wl-clipboard')
makedepends=('make')
provides=('xclip' 'xsel')
conflicts=('xclip' 'xsel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/brunelli/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('25a4b4519600e19f8503569b46c80bcbf2d8647ace384d4acacb67e3114a21c6')

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="$pkgdir"
}
