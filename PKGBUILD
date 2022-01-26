# Maintainer: Mehmet Akif Duba <mail[at]makifdb[dot]com>

# Based on the code from:
# Lenovsky    <lenovsky@pm.me>

pkgname=lenopow
pkgver=1.0.4
pkgrel=1
pkgdesc="A script to enable/disable battery conservation mode in Lenovo Ideapad/LEGION notebooks."
arch=('any')
url="https://github.com/makifdb/${pkgname}"
license=('custom:unlicense')
source=("https://github.com/makifdb/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('d4b3e4453a65ebe3e67dea817e162aea391bceb8ab6b8f7e3cb02f25f41a13e4')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

