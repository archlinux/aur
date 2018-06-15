# Maintainer: JoshuaRLi <joshua.r.li.98 at gmail com>
# Please submit comments/issues here: https://github.com/JoshuaRLi/PKGBUILDs

pkgname=vape-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="A command-line tool that converts text into 'vaporwave' text - fullwidth UTF-8 characters."
arch=('x86_64')
_ghrepo_=vape
url="https://github.com/JoshuaRLi/${_ghrepo_}"
license=('MIT')
provides=('vape')
conflicts=('vape')
options=(!strip)

source_x86_64=("${url}/releases/download/v${pkgver}/vape-x86_64-unknown-linux-gnu")
sha512sums_x86_64=('764b95fb682b0b4e2edc6a14b5c4a9aef2167f80db2be6d613d19bdd7cc8a7756bc4132060ecc8c8dad2de0640c15e0a1502e5bbdd18d20f9ffa1e1470000681')

package () {
  cd "$srcdir"
  install -Dm 755 vape-x86_64-unknown-linux-gnu "${pkgdir}/usr/bin/vape"
}
