#Maintainer: TingPing <tingping@tingping.se>
pkgname=geany-tags
pkgver=20141127
pkgrel=1
pkgdesc='Geany tags for C, C++, CSS, GLSL, Java, JavaScript, LaTeX, PHP, Python, Ruby, Tcl, Vala and more'
url='http://wiki.geany.org/tags/start'
license=('GPL')
arch=('any')
depends=('geany')
source=('geany-tags.tar.bz2::http://wiki.geany.org/get_tags')
md5sums=('3a187ded43542107de05d6d455faf5e8')

package() {
    cd tags
    mkdir -p "$pkgdir"/usr/share/geany/tags/
    install -Dm0644 * "$pkgdir"/usr/share/geany/tags/
}

