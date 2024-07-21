# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Joel <aullidolunar (at) gmai1 dot c0m >
# Contributor: TingPing <tingping@tingping.se>

pkgname=geany-tags
pkgver=20240721
pkgrel=1
pkgdesc='Geany tags for C, C++, CSS, GLSL, Java, JavaScript, LaTeX, PHP, Python, Ruby, Tcl, Vala and more'
url='http://wiki.geany.org/tags/start'
license=(GPL-2.0-or-later)
arch=(any)
depends=(geany)
source=("$pkgname-$pkgver.tar.bz2::http://wiki.geany.org/get_tags")
sha256sums=('42f7577f1953e2bce8c65e545d0744971fe24766cf9ceb51f566c0ff6c5b5762')

package() {
    cd tags
    find . -type f -exec install -vDm 644 '{}' "$pkgdir/usr/share/geany/tags/{}" \;
}
