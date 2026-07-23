# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>
# Contributor: Vladislav Minakov <v@minakov.pro>

pkgname=ketesa
pkgver=1.4.0
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
sha512sums=('22af595864cc950de418cd9210a1085d59d071394070323970254a4e44f75bc6ee403e32d7e9fc8737db3964534c79d753b37b23bd7a08b0e215d7602d2d3b6f')


package() {
  cd "$srcdir/"
  
  mkdir -p "${pkgdir}/usr/share/webapps/"
  cp -r "$pkgname" "${pkgdir}/usr/share/webapps/"
}


