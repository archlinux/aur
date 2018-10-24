# Maintainer: Ainola
# Contributor: Anthony Samartsev

pkgname=xcursor-pixelfun
pkgver=3.2
pkgrel=8
pkgdesc="Minimalistic cursor theme with a piece of old-school"
arch=('any')
url="https://www.gnome-look.org/p/999913/"
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::https://dl.opendesktop.org/api/files/download/id/1461762510/s/d1f4905609d894fdfdc01d9a9276c763/t/1540331044/u//168338-pixelfun3.tar.gz")
sha256sums=('cf7bd96a26e47ac0940bd65a508201f1f7a3b950dce2165238af1d67047e10e7')

package() {
    mkdir -p "$pkgdir/usr/share/icons"
    cp -r pixelfun3 "$pkgdir/usr/share/icons/"
    find "$pkgdir/usr/share/icons/pixelfun3" -type f -exec chmod 644 {} +
    find "$pkgdir/usr/share/icons/pixelfun3" -type d -exec chmod 755 {} +
}
