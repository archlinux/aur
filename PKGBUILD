# Maintainer: Daniel Milde <daniel at milde dot cz>

pkgname=container-diff
pkgver=0.13.1
pkgrel=1
pkgdesc="Diff your Docker containers"
arch=(x86_64)
url="https://github.com/GoogleCloudPlatform/container-diff"
license=('Apache')
depends=('glibc')
source=(${pkgname}-${pkgver}::https://storage.googleapis.com/container-diff/v${pkgver}/container-diff-linux-amd64)
sha512sums=('4b12abbd0fa2014bbae1153675a504f77e9c90e90a3a59e6d75dc35d60363efe4b34251305a8f9359e39606225fc042488f037167dccb06b635935d5ebf158b6')

package() {
  chmod +x ${pkgname}-${pkgver}
  install -D -m0755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/container-diff"
}



