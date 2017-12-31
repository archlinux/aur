# Maintainer: levinit <levinit@outlook.com>

pkgname=grub-themes-solarized-dark-materialized
_pkgname=solarized-dark-materialized
pkgver=1.0
pkgrel=2
pkgdesc='Solarized-Dark-Materialized grub2 theme'
arch=(any)
url='https://www.gnome-look.org/p/1180510/'
license=('custom')
depends=('grub')
optdepends=('grub-customizer')
install=${pkgname}.install

source=('https://dl.opendesktop.org/api/files/downloadfile/id/1497095343/s/18bc1750fc966e0316672eb1d2bfbf31/t/1514732574/Solarized-Dark-Materialized.zip')

md5sums=('SKIP')

package() {
    install -dm755 $pkgdir/boot/grub/themes/
    cp $srcdir/$_pkgname $pkgdir/boot/grub/themes/ -r
}
