# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>
# Contributor: Vladislav Minakov <v@minakov.pro>

pkgname=ketesa
pkgver=1.5.2
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
sha512sums=('f52ad974f111b5a6c314329aab36add3d3728908fc0aa8654b77b8fe510c3d9114d6ab5d2f5c7f72989e8bc383c837d6147c3accde6ad21cf953af5c5b360d7e')


package() {
  cd "$srcdir/"
  
  mkdir -p "${pkgdir}/usr/share/webapps/"
  cp -r "$pkgname" "${pkgdir}/usr/share/webapps/"
}


