# Maintainer: fleger <florian6 dot leger at laposte dot net>
pkgname=fortune-mod-ferengi_rules_of_acquisition
pkgver=20080318
pkgrel=1
pkgdesc="Fortune cookies: The Ferengi Rules of Acquisition from Star Trek"
arch=('any')
license=('unknown')
depends=(fortune-mod)
url="http://sce-tindy.tecnik93.com/FreeBSD/ports/"
#source=("http://sce-tindy.tecnik93.com/FreeBSD/ports/$pkgname/sources/$pkgname-$(date -d $pkgver +%Y.%m.%d).tar.gz")
source=('http://slackware-srbija.org/forum/download/file.php?id=1702&sid=1c7690021d14d0e0c230b3c5cd98b56f')
md5sums=('9af99a1ec32ae5130f5d8678e40ca46f')

build() {
  cd "$srcdir"
  strfile "$pkgname" "$pkgname.dat"
}

package() {
  cd "$srcdir"
  install -Dm644 "$pkgname" "$pkgdir/usr/share/fortune/ferengi_rules_of_acquisition"
  install -Dm644 "$pkgname.dat" "$pkgdir/usr/share/fortune/ferengi_rules_of_acquisition.dat"
}
