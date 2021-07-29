# Maintainer: ItzSelenux <zariepcommunication@gmail.com>
pkgname=antix-icewmcc
pkgver=0.2.1a
pkgrel=1
pkgdesc="IceWM Control Center, from Antix Linux project"
url="https://github.com/ItzSelenux/antix-icewmcc"
arch=('x86_64')
license=("GPL2")
depends=('gtkdialog' 'yad' 'icewm')
provides=('icewmcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e6e14e1f7c81f08286598b4b3fd6c8a2b41673b1a42a2aed6ee0a8fdaa703cc2')
 
package() {
  cd "$pkgname-$pkgver/"
  install -Dm755 "icewmcc" -t "$pkgdir/usr/bin"
  install -Dm755 "icewmcccpumon" -t "$pkgdir/usr/bin"
  install -Dm755 "icewmccmail" -t "$pkgdir/usr/bin"
  install -Dm755 "icewmccmovestat" -t "$pkgdir/usr/bin"
  install -Dm755 "icewmccnetmon" -t "$pkgdir/usr/bin"
  install -Dm755 "icewmccopmove" -t "$pkgdir/usr/bin"
  install -Dm755 "icewmccopresize" -t "$pkgdir/usr/bin"
  install -Dm755 "icewmccshowwkspaces" -t "$pkgdir/usr/bin"
  install -Dm755 "icewmccshtb" -t "$pkgdir/usr/bin"
  install -Dm755 "icewmcctbheight" -t "$pkgdir/usr/bin"
  install -Dm755 "icewmcctbpos" -t "$pkgdir/usr/bin"
  install -Dm755 "icewmccwinlist" -t "$pkgdir/usr/bin"
  install -Dm755 "icewmccwkspaces" -t "$pkgdir/usr/bin"

  install -Dm755 "IceWMcc.desktop" -t "$pkgdir/usr/share/applications"

  install -Dm755 "icewmccprefs.pl" -t "$pkgdir/usr/share/icewmcc"
  install -Dm755 "icewmccwkspaces.pl" -t "$pkgdir/usr/share/icewmcc"

}
