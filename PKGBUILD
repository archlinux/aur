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
sha256sums=('ec704e47143f86ff8634249185e8dc2da006203064683f15d5a5e1cd3d4c3448')
 
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

}
