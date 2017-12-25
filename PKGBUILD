# Maintainer: kewl fft <kewl@alto.eu.org>

pkgname=dse
pkgver=1.00
pkgrel=2
pkgdesc="AES file encryption using a keyfile."
arch=('any')
url="http://members.ozemail.com.au/~nulifetv/freezip/freeware/index.html"
makedepends=('gcc')
license=('MIT')
source=("https://github.com/kewlfft/dse/archive/v1.00.tar.gz")
sha256sums=('df63e3d1f0f35ece3ba02f84210c36e718821f59b347563e826a219ea81ef5e1')

build() {
    cd "$srcdir/dse-$pkgver"
    make
}

package() {
    cd "$srcdir/dse-$pkgver"
    install -Dm 0755 dse "$pkgdir/usr/bin/dse"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
