# Maintainer: Joel <aullidolunar (at) gmai1 dot c0m >
# Maintainer: TingPing <tingping@tingping.se>
pkgname=geany-tags
pkgver=20170424
pkgrel=0
pkgdesc='Geany tags for C, C++, CSS, GLSL, Java, JavaScript, LaTeX, PHP, Python, Ruby, Tcl, Vala and more'
url='http://wiki.geany.org/tags/start'
license=('GPL')
arch=('any')
depends=('geany')
source=('geany-tags.tar.bz2::http://wiki.geany.org/get_tags')
sha1sums=('6cd209965aeea3a8a9b67c5721e859f6379606cf')

package() {
    cd tags
    find . -type f -exec install -Dm0644 '{}' "$pkgdir/usr/share/geany/tags/{}" \;
}
