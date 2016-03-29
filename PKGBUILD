# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Leo von Klenze <aur@leo.von-klenze.de>

pkgname=jquery
pkgver=2.2.2
pkgrel=1
pkgdesc="Cross-platform JavaScript library designed to simplify the client-side scripting of HTML"
arch=('any')
url="http://jquery.com"
license=('MIT' 'GPL2')
source=("http://code.jquery.com/jquery-${pkgver}.min.js")
sha256sums=('dfa729d82a3effadab1000181cb99108f232721e3b0af74cfae4c12704b35a32')

package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    install -m644 "jquery-${pkgver}.min.js" \
      "${pkgdir}/usr/share/jquery/jquery.min.js"
}
