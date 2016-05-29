# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: Karol 'Kenji Takahashi' Woźniak <kenji.sx>
# Contributor: Jarred Leonardo <jarredleonardo at googlemail dot com>

pkgname=xcursor-mirrunde
pkgver=0.5.0
pkgrel=2
pkgdesc="mirRunde cursor theme"
arch=('any')
url="http://gnome-look.org/content/show.php/mirRunde?content=81843"
license=('GPL')
depends=()
source=("http://gnome-look.org/CONTENT/content-files/81843-mirRunde.tar.gz")
md5sums=('24eda74893129dbc71aca6e35bd8b322')

package() {
cd ${srcdir}
install -dm755 ${pkgdir}/usr/share/icons/
cp -vR mirRunde ${pkgdir}/usr/share/icons/
}


