# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>
# Contributor: Vladislav Minakov <v@minakov.pro>

pkgname=ketesa
pkgver=1.5.1
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
sha512sums=('da8dc04f77d198ec426ea3276881707d28ac7adbefe3e95c7aaaec3ee7092353b5880038d5ebd3f366c92f31ec28bcab74a33bd10ef53a9ab154b951b1abbcb7')


package() {
  cd "$srcdir/"
  
  mkdir -p "${pkgdir}/usr/share/webapps/"
  cp -r "$pkgname" "${pkgdir}/usr/share/webapps/"
}


