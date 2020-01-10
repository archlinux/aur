# Maintainer: Jorengarenar

pkgname=css-beautify-git
_pkgname=css-beautify
pkgver=1.10.3
pkgrel=1
pkgdesc='Beautifier for CSS'
arch=('any')
depends=('python-jsbeautifier')
url='https://github.com/beautify-web/js-beautify/#css--html'
license=('MIT')
source=("${_pkgname}::git+https://github.com/Jorengarenar/css-beautify.git")
sha512sums=(SKIP)

MODULENAME=cssbeautifier

package() {
    cd "$srcdir/$pkgname-${pkgver}"
    mkdir -p "${pkgdir}/usr/lib/python3.8/"
    cp -r "${MODULENAME}" "${pkgdir}/usr/lib/python3.8/${MODULENAME}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
