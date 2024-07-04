# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=synapse-admin
pkgver=0.10.1
pkgrel=1
pkgdesc="A Matrix administration panel using react-admin"
arch=('any')
license=('Apache License 2.0')
optdepends=('nginx: reverse-proxy')
url="https://github.com/Awesome-Technologies/synapse-admin"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Awesome-Technologies/synapse-admin/releases/download/${pkgver}/synapse-admin-${pkgver}.tar.gz")
sha512sums=('a38c462727eb8e91e39570d6af4ad1cd94ab6e10942107736a3ce6b0bd48d9640acdf95f47e5677385cbdba4b371c0c3d7377c841998ddfb214d1a70e99c0e19')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}"
  cp -r $srcdir/${pkgname}-${pkgver}/* "${pkgdir}/usr/share/webapps/${pkgname}/"
}
