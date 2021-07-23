# Maintainer: ItzSelenux <zariepcommunication@gmail.com>
pkgname=antix-icewmcc
pkgver=0.2.1
pkgrel=1
pkgdesc="IceWM Control Center, from Antix Linux project"
url="https://github.com/ItzSelenux/antix-icewmcc"
arch=('any')
license=('unknown')
depends=('gtkdialog' 'yad' 'icewm')
provides=('icewmcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('cf34d05852f5d313a82ef23a415926ef4c9f4fa3673fdb71ba047d73597c0a9e')
 
package() {
  cd "$pkgname-$pkgver/"
  install -Dm755 "icewmcc.sh" -t "$pkgdir/usr/local/bin/icewmcc"
  install -Dm755 "icewmcccpumon.sh" -t "$pkgdir/usr/local/bin/icewmcc"
  install -Dm755 "icewmccmail.sh" -t "$pkgdir/usr/local/bin/icewmcc"
  install -Dm755 "icewmccmovestat.sh" -t "$pkgdir/usr/local/bin/icewmcc"
  install -Dm755 "icewmccnetmon.sh" -t "$pkgdir/usr/local/bin/icewmcc"
  install -Dm755 "icewmccopmove.sh" -t "$pkgdir/usr/local/bin/icewmcc"
  install -Dm755 "icewmccopresize.sh" -t "$pkgdir/usr/local/bin/icewmcc"
  install -Dm755 "icewmccprefs.pl" -t "$pkgdir/usr/local/bin/icewmcc"
  install -Dm755 "icewmccshowwkspaces.sh" -t "$pkgdir/usr/local/bin/icewmcc"
  install -Dm755 "icewmccshtb.sh" -t "$pkgdir/usr/local/bin/icewmcc"
  install -Dm755 "icewmcctbheight.sh" -t "$pkgdir/usr/local/bin/icewmcc"
  install -Dm755 "icewmcctbpos.sh" -t "$pkgdir/usr/local/bin/icewmcc"
  install -Dm755 "icewmccwinlist.sh" -t "$pkgdir/usr/local/bin/icewmcc"
  install -Dm755 "icewmccwkspaces.pl" -t "$pkgdir/usr/local/bin/icewmcc"
  install -Dm755 "icewmccwkspaces.sh" -t "$pkgdir/usr/local/bin/icewmcc"
  install -Dm755 "IceWMcc.desktop" -t "$pkgdir/usr/share/applications"

}
