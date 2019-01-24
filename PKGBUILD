# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=wl-clipboard-x11
pkgver=1
pkgrel=1
pkgdesc='A wrapper to use wl-clipboard as a drop-in replacement to X11 clipboard tools'
url='https://github.com/brunelli/wl-clipboard-x11'
license=('GPL')
arch=('any')
depends=('bash' 'wl-clipboard')
provides=('xclip' 'xsel')
conflicts=('xclip' 'xsel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/brunelli/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('6b990aa6dd94221ee1db49fbe0954a689a7e3479b94d380d89d4e596e8e9176b')

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="$pkgdir"
}
