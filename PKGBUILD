# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=wl-clipboard-x11
pkgver=5
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
sha256sums=('72ee2d932d93401e23fd5600ffd129cc4ef2f8686c84972bdd1c917ce31678bc')

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="$pkgdir"
}
