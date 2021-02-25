# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
pkgname=rndsig
pkgver=3
pkgrel=1
pkgdesc="The ultimate email signature randomiser."
arch=('any')
url="https://billy.wolfe.casa/scripts/rndsig"
license=('WTFPL')
depends=('bash')
provides=("$pkgname")
conflicts=("$pkgname")
source=("${url}")
sha512sums=('026f03e0af7d31ff37c9e809eb6d9eb2e08e88769317d3a484715d18e231640bd861602fc5d7ec8c1c9a26a449291ea4ed3f21f64bca499ad9440cc3b7252c63')

package()
 {
 install -Dm 755 "rndsig" "$pkgdir/usr/bin/rndsig"
  }

# vim:set ts=2 sw=2 et:
