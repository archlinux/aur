# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Leo von Klenze <aur@leo.von-klenze.de>

pkgname=jquery
pkgver=3.6.1
pkgrel=1
pkgdesc="Cross-platform JavaScript library designed to simplify the client-side scripting of HTML"
arch=('any')
url="https://jquery.com"
license=('MIT')
source=("https://code.jquery.com/jquery-${pkgver}.js"
		"https://code.jquery.com/jquery-${pkgver}.min.js"
		"https://code.jquery.com/jquery-${pkgver}.min.map"
		"https://code.jquery.com/jquery-${pkgver}.slim.min.js"
		"https://code.jquery.com/jquery-${pkgver}.slim.js"
		"https://code.jquery.com/jquery-${pkgver}.slim.min.map"
		"LICENSE::https://raw.githubusercontent.com/jquery/jquery/${pkgver}/LICENSE.txt")
sha256sums=('df3941e6cdaec28533ad72b7053ec05f7172be88ecada345c42736bc2ffba4d2'
            'a3cf00c109d907e543bc4f6dbc85eb31068f94515251347e9e57509b52ee3d74'
            '856ee620cebac56e872d6e99b09de05f81ccd3f3dc346e9b55eb694611a6d5e1'
            'c3c0af845b3b88735552d9d23f460a120d34a7d221d77ae52fdcc6aaf2dd78f0'
            'b579beb1ad6ecec6c59db5edf0626ab208b64f0fa6e012c60e87fa7943e36ed9'
            '65c499850d696db1c126c63c8fd6cbfe35a00ff205fc9f8f9e09580fea9be753'
            'd4db9ebe6f29f5168eac45ad713f055623ac5d0dcd5ba92da23d650ae012020d')

package() {
    cd "${srcdir}"
    install -d "${pkgdir}/usr/share/javascript/${pkgname}"
    install -m644 "jquery-${pkgver}.js" "${pkgdir}/usr/share/javascript/jquery/jquery.js"
    install -m644 "jquery-${pkgver}.min.js" "${pkgdir}/usr/share/javascript/jquery/jquery.min.js"
    install -m644 "jquery-${pkgver}.min.map" "${pkgdir}/usr/share/javascript/jquery/jquery.min.map"
    install -m644 "jquery-${pkgver}.slim.min.js" "${pkgdir}/usr/share/javascript/jquery/jquery.slim.min.js"
    install -m644 "jquery-${pkgver}.slim.js" "${pkgdir}/usr/share/javascript/jquery/jquery.slim.js"
    install -m644 "jquery-${pkgver}.slim.min.map" "${pkgdir}/usr/share/javascript/jquery/jquery.slim.min.map"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
