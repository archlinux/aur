# Maintainer: psi4j <https://github.com/psi4j>
pkgname=ter-v24b-rounded
pkgver=1.0.0
pkgrel=1
pkgdesc="Terminus console font with rounded box-drawing corners for TTY"
arch=('any')
url="https://github.com/psi4j/ter-v24b-rounded"
license=('OFL-1.1')
depends=('kbd')
options=('!debug')
source=("$pkgname-$pkgver.psf.gz::https://github.com/psi4j/ter-v24b-rounded/releases/download/v$pkgver/ter-v24b-rounded.psf.gz")
sha256sums=('c0d4ed6f25baa885e30c88a853682168a311f83bb329cf55fbe60de5b46408b3')

package() {
    install -Dm644 "$srcdir/$pkgname-$pkgver.psf.gz" \
        "$pkgdir/usr/share/kbd/consolefonts/ter-v24b-rounded.psf.gz"
}
