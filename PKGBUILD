# Maintainer: pierspad <pierpaolospadafora@proton.me>
pkgname=prmt
pkgver=0.1.8
pkgrel=1
pkgdesc="A tool for prompt manipulation (Binary version)"
arch=('x86_64')
url="https://github.com/3axap4eHko/prmt"
license=('MIT') 
provides=('prmt')
conflicts=('prmt')

source=("https://github.com/3axap4eHko/prmt/releases/download/v${pkgver}/prmt-x86_64-unknown-linux-gnu-ubuntu-24.04.tar.gz")

sha256sums=('2a1b3e1bbb1030f84f04ac77836ab2fbfd4418656bf4ca0d124d60f8321a4e50')

package() {
    _dirname="prmt-x86_64-unknown-linux-gnu-ubuntu-24.04"

    install -Dm755 "${srcdir}/${_dirname}/prmt" "${pkgdir}/usr/bin/prmt"

    install -Dm644 "${srcdir}/${_dirname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
