# Maintainer: Jorengarenar

pkgname=css-beautify
pkgver=1.10.1
pkgrel=2
pkgdesc='Beautifier for CSS'
arch=('any')
depends=('python-jsbeautifier')
url='https://github.com/beautify-web/js-beautify/#css--html'
license=('MIT')
source=("${pkgname}::git+https://github.com/Jorengarenar/css-beautify.git")
sha512sums=(SKIP)

package() {
    cd "$srcdir/$pkgname/src"
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    cp -r cssbeautifier "${pkgdir}/usr/share/${pkgname}"
    install -Dm755 $pkgname "${pkgdir}/usr/share/${pkgname}"
    mkdir -p "${pkgdir}/usr/bin"
    cd "$srcdir/$pkgname"
    install -Dm755 $pkgname "${pkgdir}/usr/bin"
}
