# Maintainer: Helmut Stult <helmut[at]manjaro[dot]org>

# Based on the code from:
# Lenovsky    <lenovsky@pm.me>

pkgname=lenopow
pkgver=1.0.4
pkgrel=1
pkgdesc="A script to enable/disable battery conservation mode in Lenovo Ideapad/LEGION notebooks."
arch=('any')
url="https://github.com/schinfo/${pkgname}"
license=('custom:unlicense')
source=("https://github.com/schinfo/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('3a018b070e08df728a39bdd6d4bf1a75083b06c3fe6a0b54ac11e6895fa2e4ec')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
