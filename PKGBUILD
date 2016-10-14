# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Leo von Klenze <aur@leo.von-klenze.de>

pkgname=jquery
pkgver=3.1.1
pkgrel=1
pkgdesc="Cross-platform JavaScript library designed to simplify the client-side scripting of HTML"
arch=('any')
url="http://jquery.com"
license=('MIT' 'GPL2')
source=("http://code.jquery.com/jquery-${pkgver}.min.js")
sha256sums=('85556761a8800d14ced8fcd41a6b8b26bf012d44a318866c0d81a62092efd9bf')

package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/share/javascript/${pkgname}"
    install -m644 "jquery-${pkgver}.min.js" "${pkgdir}/usr/share/javascript/jquery/jquery.min.js"
}
