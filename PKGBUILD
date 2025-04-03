# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Joel <aullidolunar (at) gmai1 dot c0m >
# Contributor: TingPing <tingping@tingping.se>

pkgname=geany-tags
pkgver=20250403
pkgrel=1
pkgdesc='Geany tags for C, C++, CSS, GLSL, Java, JavaScript, LaTeX, PHP, Python, Ruby, Tcl, Vala and more'
url='http://wiki.geany.org/tags/start'
license=(GPL-2.0-or-later)
arch=(any)
depends=(geany)
source=("$pkgname-$pkgver.tar.bz2::http://wiki.geany.org/get_tags")
sha256sums=('20422560bb4ba723139e8f51bcca3ad47e4afb79f3bd9af52d55e898da01d01f')

package() {
    cd tags
    find . -type f -exec install -vDm 644 '{}' "$pkgdir/usr/share/geany/tags/{}" \;
}
