# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>
# Contributor: Vladislav Minakov <v@minakov.pro>

pkgname=ketesa
pkgver=1.3.0
pkgrel=1
pkgdesc="A Matrix administration panel using react-admin"
arch=('any')
license=('Apache-2.0')
optdepends=(
	'nginx: reverse-proxy'
	'httpd: reverse-proxy'
)
url="https://github.com/etkecc/ketesa"
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}.tar.gz")
sha512sums=('2f573f104d2239b01ad65a9c8c94241ab12c339c2a03c9c48a3e1e8a6cafb6aa74e04f6164e1b51661ebdefec507f1d72c8d59cbab1b04fedb240d980763657b')


package() {
  cd "$srcdir/"
  
  mkdir -p "${pkgdir}/usr/share/webapps/"
  cp -r "$pkgname" "${pkgdir}/usr/share/webapps/"
}


