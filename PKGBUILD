# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Leo von Klenze <aur@leo.von-klenze.de>

pkgname=jquery
pkgver=3.6.0
pkgrel=1
pkgdesc="Cross-platform JavaScript library designed to simplify the client-side scripting of HTML"
arch=('any')
url="https://jquery.com"
license=('MIT')
source=("https://code.jquery.com/jquery-${pkgver}.min.js"
		"https://code.jquery.com/jquery-${pkgver}.min.map"
		"https://code.jquery.com/jquery-${pkgver}.slim.min.js"
		"https://code.jquery.com/jquery-${pkgver}.slim.js"
		"https://code.jquery.com/jquery-${pkgver}.slim.min.map"
		"LICENSE::https://raw.githubusercontent.com/jquery/jquery/${pkgver}/LICENSE.txt")
sha256sums=('ff1523fb7389539c84c65aba19260648793bb4f5e29329d2ee8804bc37a3fe6e'
            '399548fb0e7b146c12f5ba18099a47d594a970fee96212eee0ab4852f3e56782'
            'bbb7b9921ca2b61948753a6edb63c78443663dc45d1621d18e102e1dcb34e512'
            '1f058e34466ba6ea21f79d5c403d68bf61d42b9cc0e43c09d433545da33a16c6'
            'e5f97a98e2d69c0f1e098991d303f66c24c615ef6782014af25a617f7571b4b7'
            'd4db9ebe6f29f5168eac45ad713f055623ac5d0dcd5ba92da23d650ae012020d')

package() {
    cd "${srcdir}"
    install -d "${pkgdir}/usr/share/javascript/${pkgname}"
    install -m644 "jquery-${pkgver}.min.js" "${pkgdir}/usr/share/javascript/jquery/jquery.min.js"
    install -m644 "jquery-${pkgver}.min.map" "${pkgdir}/usr/share/javascript/jquery/jquery.min.map"
    install -m644 "jquery-${pkgver}.slim.min.js" "${pkgdir}/usr/share/javascript/jquery/jquery.slim.min.js"
    install -m644 "jquery-${pkgver}.slim.js" "${pkgdir}/usr/share/javascript/jquery/jquery.slim.js"
    install -m644 "jquery-${pkgver}.slim.min.map" "${pkgdir}/usr/share/javascript/jquery/jquery.slim.min.map"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
