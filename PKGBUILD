# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Joel <aullidolunar (at) gmai1 dot c0m >
# Contributor: TingPing <tingping@tingping.se>

pkgname=geany-tags
pkgver=20210529
pkgrel=1
pkgdesc='Geany tags for C, C++, CSS, GLSL, Java, JavaScript, LaTeX, PHP, Python, Ruby, Tcl, Vala and more'
url='http://wiki.geany.org/tags/start'
license=('GPL')
arch=('any')
depends=('geany')
source=('geany-tags.tar.bz2::http://wiki.geany.org/get_tags')
sha1sums=('20ffeea7da17e4e6a2ced9c5bd19392787b87a03')

package() {
    cd tags
    find . -type f -exec install -Dm0644 '{}' "$pkgdir/usr/share/geany/tags/{}" \;
}
