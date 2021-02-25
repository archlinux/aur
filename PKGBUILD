# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
pkgname=rndsig
pkgver=4
pkgrel=1
pkgdesc="The ultimate email signature randomiser."
arch=('any')
url="https://billy.wolfe.casa/scripts/rndsig"
license=('WTFPL')
depends=('bash')
provides=("$pkgname")
conflicts=("$pkgname")
source=("${url}")
sha512sums=('4f995c83c076ddc8db1889fd35cc1602c58ef799218a56aa3b1269e3b1d49e1399e4d9aa4eed0848245d1d4059121d1eff0d13c08ec8d1ec695b85e89c62e4a2')

package()
 {
 install -Dm 755 "rndsig" "$pkgdir/usr/bin/rndsig"
  }

# vim:set ts=2 sw=2 et:
