# Maintainer: erdii <me@erdii.engineering>
pkgname=aquayman-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="Manage quay.io teams and permissions declaratively."
arch=("x86_64")
url=https://github.com/kubermatic-labs/aquayman
license=('Apache')
depends=()
makedepends=()
conflicts=()
providers=('aquayman')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kubermatic-labs/aquayman/releases/download/v${pkgver}/aquayman_${pkgver}_linux_amd64.zip")
sha256sums=('18ddd24bb051c071f901c37fcbf553236a92bf30023a5caf568f9d356c63e169')

package() {
  install -Dm0755 "${srcdir}/aquayman" "${pkgdir}/usr/bin/aquayman"
}
