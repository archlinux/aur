# Maintainer: Jorengarenar

pkgname=css-beautify
pkgver=1.10.2
pkgrel=2
pkgdesc='Beautifier for CSS'
arch=('any')
depends=('python')
license=('MIT')
source=("${pkgname}::https://github.com/Jorengarenar/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=(SKIP)

MODULENAME=cssbeautifier

package() {
    cd "$srcdir/$pkgname-${pkgver}"
    mkdir -p "${pkgdir}/usr/lib/python3.8/"
    cp -r "${MODULENAME}" "${pkgdir}/usr/lib/python3.8/${MODULENAME}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin"
}
