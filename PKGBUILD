# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Leo von Klenze <aur@leo.von-klenze.de>

pkgname=jquery
pkgver=2.2.0
pkgrel=1
pkgdesc="Cross-platform JavaScript library designed to simplify the client-side scripting of HTML"
arch=('any')
url="http://jquery.com"
license=('MIT' 'GPL2')
source=("http://code.jquery.com/jquery-${pkgver}.min.js")
sha256sums=('8a102873a33f24f7eb22221e6b23c4f718e29f85168ecc769a35bfaed9b12cce')

package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    install -m644 "jquery-${pkgver}.min.js" \
      "${pkgdir}/usr/share/jquery/jquery.min.js"
}
