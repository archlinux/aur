# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Joel <aullidolunar (at) gmai1 dot c0m >
# Contributor: TingPing <tingping@tingping.se>

pkgname=geany-tags
pkgver=20260316
pkgrel=1
pkgdesc='Geany tags for C, C++, CSS, GLSL, Java, JavaScript, LaTeX, PHP, Python, Ruby, Tcl, Vala and more'
url='https://wiki.geany.org/tags/start'
license=(GPL-2.0-or-later)
arch=(any)
depends=(geany)
source=("$pkgname-$pkgver.tar.bz2::https://wiki.geany.org/get_tags")
sha256sums=('77bb6277f25d49e8e342c19c5f06e9d3a21952efe0401efdbd9385613c9a1b6c')

package() {
    cd tags
    find . -type f -exec install -vDm 644 '{}' "$pkgdir/usr/share/geany/tags/{}" \;
}
