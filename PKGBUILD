# aercbook-bin
# A minimal address book for the aerc email client
# Maintainer: Dian Fay <dian dot m dot fay at gmail dot com>
pkgname=aercbook-bin
pkgver=0.1.5
pkgrel=1
pkgdesc='A minimal address book for the aerc email client'
provides=('aercbook')
arch=('x86_64')
url='https://git.sr.ht/~renerocksai/aercbook'
license=('MIT')
depends=('aerc')
source=("https://git.sr.ht/~renerocksai/aercbook/refs/download/v${pkgver}/aercbook-v${pkgver}--x86_64-linux.gz")
sha256sums=('871c9732a212f1c04a3a69356aaaa39d9f0e64aed4401d4c7bb443440eb3a79f')

package() {
    cd "$srcdir"
    install -Dm755 "aercbook-v${pkgver}--x86_64-linux" "${pkgdir}/usr/local/bin/aercbook"
}
