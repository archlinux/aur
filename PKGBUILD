# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
pkgname=rndsig
pkgver=6
pkgrel=1
pkgdesc="The ultimate email signature randomiser."
arch=('any')
url="https://billy.wolfe.casa/scripts/rndsig"
license=('WTFPL')
depends=('bash')
provides=("$pkgname")
conflicts=("$pkgname")
source=("${url}")
sha512sums=('9e2a6a2bf2b6190e9ea2de67e93f790d164ff0078ddab7090a28b8dda5f85e6ac9df5e585c6fb6db8a73c6320363955ef0aa94dbdc1f0c28b37565186de98d92')

package()
 {
 install -Dm 755 "rndsig" "$pkgdir/usr/bin/rndsig"
  }

# vim:set ts=2 sw=2 et:
