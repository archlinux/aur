# Mantainer: Daniel Urdiales <daniurdi46@gmail.com>

pkgname=disk-remover
pkgver=1.0
pkgrel=0
pkgdesc="A little script that helps you to remove disks"
arch=(any)
url="https://github.com/dus2002/Disk-Remover"
license=(GPL)
source=("$pkgname.desktop" "https://github.com/dus2002/Disk-Remover/raw/$pkgver/disk-remover")
sha512sums=('SKIP' 'SKIP')

package() {
  mkdir -p ${pkgdir}/usr/share/applications
  cp $pkgname.desktop ${pkgdir}/usr/share/applications/$pkgname.desktop
  mkdir -p $pkgdir/usr/bin/
  cp $pkgname $pkgdir/usr/bin/
}
