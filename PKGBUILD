# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Joel <aullidolunar (at) gmai1 dot c0m >
# Contributor: TingPing <tingping@tingping.se>

pkgname=geany-tags
pkgver=20230702
pkgrel=1
pkgdesc='Geany tags for C, C++, CSS, GLSL, Java, JavaScript, LaTeX, PHP, Python, Ruby, Tcl, Vala and more'
url='http://wiki.geany.org/tags/start'
license=(GPL)
arch=(any)
depends=(geany)
source=("$pkgname-$pkgver.tar.bz2::http://wiki.geany.org/get_tags")
sha256sums=('11dbd860569da25ded2d289560bbb0e214c5501ed448aa3d18304eae2cdf9300')

package() {
    cd tags
    find . -type f -exec install -vDm 644 '{}' "$pkgdir/usr/share/geany/tags/{}" \;
}
