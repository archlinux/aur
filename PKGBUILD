# aercbook-bin
# A minimal address book for the aerc email client
# Maintainer: Dian Fay <dian dot m dot fay at gmail dot com>
pkgname=aercbook-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='A minimal address book for the aerc email client'
provides=('aercbook')
arch=('x86_64')
url='https://git.sr.ht/~renerocksai/aercbook'
license=('MIT')
depends=('aerc')
source=("https://git.sr.ht/~renerocksai/aercbook/refs/download/v${pkgver}/aercbook-v${pkgver}--x86_64-linux.gz")
sha256sums=('25bf22245934b57b08bfee5a052bf6c0a60f3e6718ee024511fca4d9ab7057dd')

package() {
    cd "$srcdir"
    install -Dm755 "aercbook-v${pkgver}--x86_64-linux" "${pkgdir}/usr/local/bin/aercbook"
}
