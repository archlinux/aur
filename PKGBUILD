#Maintainer: TingPing <tingping@tingping.se>
pkgname=geany-tags
pkgver=20160501
pkgrel=0
pkgdesc='Geany tags for C, C++, CSS, GLSL, Java, JavaScript, LaTeX, PHP, Python, Ruby, Tcl, Vala and more'
url='http://wiki.geany.org/tags/start'
license=('GPL')
arch=('any')
depends=('geany')
source=('geany-tags.tar.bz2::http://wiki.geany.org/get_tags')
sha1sums=('1a7df196cb127b3e26dd171396d0f7707b50c0d1')

package() {
    cd tags
    mkdir -p "$pkgdir"/usr/share/geany/tags/
    install -Dm0644 * "$pkgdir"/usr/share/geany/tags/
}

