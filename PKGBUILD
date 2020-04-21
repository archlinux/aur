# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
pkgname=rndsig
pkgver=2
pkgrel=1
pkgdesc="The ultimate email signature randomiser."
arch=('any')
url="http://stormdragon.tk/scripts/rndsig"
license=('WTFPL')
depends=('bash')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname")
sha512sums=('0907afa9461911c1f541410bf09813772a137858dc79a6a32af42ea162e4c3b2a5e9443f27aa04dd0406dcfa6f2469a8d41fd0c3e03c7ef8e29c01a35900e1b8')

package()
 {
 install -Dm 755 "rndsig" "$pkgdir/usr/bin/rndsig"
  }

# vim:set ts=2 sw=2 et:
