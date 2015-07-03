# Maintainer: Marco Pompili <marcs.pompili@gmail.com>
# Contributor: Leandro Pincini <redpill@archlinux-br.org>

pkgname=gtk-bluecurve-engine
pkgver=1.0
pkgrel=4
pkgdesc="Original Bluecurve engine from Red Hat's artwork package."
source=(http://ftp.gnome.org/pub/gnome/teams/art.gnome.org/archive/themes/gtk2/GTK2-Wonderland-Engine-${pkgver}.tar.bz2)
url="https://fedoraproject.org/wiki/Design"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('gtk2' 'pkgconfig')
md5sums=('0c6a5bbba6ab18984269c7ecbfcebf16')

package() {
        cd ${srcdir}/Bluecurve
        ./configure --prefix=/usr
        make || return 1
        make prefix=${pkgdir}/usr install
}
