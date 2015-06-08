# $Id$
# Maintainer: Travis Glenn Hansen <travisghansen@yahoo.com>

pkgname=xcursor-jaguarx
pkgver=1.1
pkgrel=2
pkgdesc="animated OSX-style mouse cursors"
arch=('any')
url="http://gnome-look.org/content/show.php/jaguarx?content=14775"
license=('PerlArtistic')
groups=()
depends=()
source=('http://gnome-look.org/CONTENT/content-files/14775-jaguarx.tar.bz2')
md5sums=('bda85cac7a92327086249f3fbc8be08d')

package() {
    cd "${srcdir}"
    install -d "${pkgdir}/usr/share/icons/jaguarx/cursors"
    cp -a jaguarx/cursors/* "${pkgdir}"/usr/share/icons/jaguarx/cursors
    install -Dm644 jaguarx/index.theme "${pkgdir}"/usr/share/icons/jaguarx/index.theme
}
