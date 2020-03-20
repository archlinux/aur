# Mantainer: Daniel Urdiales <daniurdi46@gmail.com>

pkgname=disk-remover
pkgver=1
pkgrel=0
pkgdesc="A little script that helps you to remove disks"
arch=(any)
url="https://github.com/dus2002/Disk-Remover"
license=(GPL)
source=("$pkgname.desktop" "$pkgname")
sha512sums=('SKIP' 'SKIP')

package() {
  mkdir -p ${pkgdir}/usr/share/applications
  cp $pkgname.desktop ${pkgdir}/usr/share/applications
  cp $pkgname $pkgdir/usr/bin
}
