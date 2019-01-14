# Maintainer: Daniel Milde <daniel at milde dot cz>

pkgname=container-diff
pkgver=0.14.0
pkgrel=1
pkgdesc="Diff your Docker containers"
arch=(x86_64)
url="https://github.com/GoogleCloudPlatform/container-diff"
license=('Apache')
depends=('glibc')
source=(${pkgname}-${pkgver}::https://storage.googleapis.com/container-diff/v${pkgver}/container-diff-linux-amd64)
sha512sums=('af8698ac967d4c03154003651ca30139a0ec7395a72de2cf0cabcc5585340e2de00a849782dc3d5e1718c66efd2ec0569ce996f445f24b4ce5e8cc6584712a57')

package() {
  chmod +x ${pkgname}-${pkgver}
  install -D -m0755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/container-diff"
}



