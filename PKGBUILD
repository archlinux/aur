# Maintainer: Joel <aullidolunar (at) gmai1 dot c0m >
# Maintainer: TingPing <tingping@tingping.se>
pkgname=geany-tags
pkgver=20191102
pkgrel=0
pkgdesc='Geany tags for C, C++, CSS, GLSL, Java, JavaScript, LaTeX, PHP, Python, Ruby, Tcl, Vala and more'
url='http://wiki.geany.org/tags/start'
license=('GPL')
arch=('any')
depends=('geany')
source=('geany-tags.tar.bz2::http://wiki.geany.org/get_tags')
sha1sums=('c9929596f6b43cf52b224a2b42c9588cc43e38a1')

package() {
    cd tags
    find . -type f -exec install -Dm0644 '{}' "$pkgdir/usr/share/geany/tags/{}" \;
}
