# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Leo von Klenze <aur@leo.von-klenze.de>

pkgname=jquery
pkgver=3.1.0
pkgrel=1
pkgdesc="Cross-platform JavaScript library designed to simplify the client-side scripting of HTML"
arch=('any')
url="http://jquery.com"
license=('MIT' 'GPL2')
source=("http://code.jquery.com/jquery-${pkgver}.min.js")
sha256sums=('702b9e051e82b32038ffdb33a4f7eb5f7b38f4cf6f514e4182d8898f4eb0b7fb')

package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/share/javascript/${pkgname}"
    install -m644 "jquery-${pkgver}.min.js" "${pkgdir}/usr/share/javascript/jquery/jquery.min.js"
}
