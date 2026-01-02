# Maintainer: pierspad <pierpaolospadafora@proton.me>
pkgname=prmt
pkgver=0.2.2
pkgrel=1
pkgdesc="A tool for prompt manipulation (Binary version)"
arch=('x86_64')
url="https://github.com/3axap4eHko/prmt"
license=('MIT') 
provides=('prmt')
conflicts=('prmt')

source=("https://github.com/3axap4eHko/prmt/releases/download/v${pkgver}/prmt-x86_64-unknown-linux-gnu-ubuntu-24.04.tar.gz")

sha256sums=('1949dcb4edb222ea59298982e596031e53b1ebe572294203e25a8c07c1e9ad44')

package() {
    _dirname="prmt-x86_64-unknown-linux-gnu-ubuntu-24.04"

    install -Dm755 "${srcdir}/${_dirname}/prmt" "${pkgdir}/usr/bin/prmt"

    install -Dm644 "${srcdir}/${_dirname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
