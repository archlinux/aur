# Maintainer: ItzSelenux <zariepcommunication@gmail.com>
pkgname=antix-icewmcc
pkgver=0.2.1
pkgrel=1
pkgdesc="IceWM Control Center, from Antix Linux project"
url="https://github.com/ItzSelenux/antix-icewmcc"
arch=('x86_64')
license=('unknown')
depends=('gtkdialog' 'yad' 'icewm')
provides=('icewmcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('37cb86d304a5d9689061e0c4bccbd84bd632922dcbe8db06ded6a2697f421c01')
 
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
