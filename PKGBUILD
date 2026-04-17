# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>
# Contributor: Vladislav Minakov <v@minakov.pro>

pkgname=ketesa
pkgver=1.1.0
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
sha512sums=('5a4ac87a08b99f31f1dd258c8cbee12ee225ec645b661596eb3c3ffedbbf47fb3f99f67142236e08d46ca9558e0d47dccb632c7a7f63af9054db3a65b2da53f2')


package() {
  cd "$srcdir/"
  
  mkdir -p "${pkgdir}/usr/share/webapps/"
  cp -r "$pkgname" "${pkgdir}/usr/share/webapps/"
}


