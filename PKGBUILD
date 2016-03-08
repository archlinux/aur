# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Leo von Klenze <aur@leo.von-klenze.de>

pkgname=jquery
pkgver=2.2.1
pkgrel=1
pkgdesc="Cross-platform JavaScript library designed to simplify the client-side scripting of HTML"
arch=('any')
url="http://jquery.com"
license=('MIT' 'GPL2')
source=("http://code.jquery.com/jquery-${pkgver}.min.js")
sha256sums=('82f420005cd31fab6b4ab016a07d623e8f5773de90c526777de5ba91e9be3b4d')

package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    install -m644 "jquery-${pkgver}.min.js" \
      "${pkgdir}/usr/share/jquery/jquery.min.js"
}
