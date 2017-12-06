# Maintainer: Daniel Milde <daniel at milde dot cz>

pkgname=container-diff
pkgver=0.5.2
pkgrel=1
pkgdesc="Diff your Docker containers"
arch=(x86_64)
url="https://github.com/GoogleCloudPlatform/container-diff"
license=('Apache')
depends=('glibc')
source=(https://storage.googleapis.com/container-diff/v${pkgver}/container-diff-linux-amd64)
sha512sums=('20083551a611dc0c6b8842772e85f89938daadd1801d0acb994b71214cd317122faa78e5fd9125849d1e2257bde8eb1a4659f0e2e6952e48ff2275f5f8134a1e')

package() {
  chmod +x container-diff container-diff-linux-amd64
  install -D -m0755 container-diff-linux-amd64 "${pkgdir}/usr/bin/container-diff"
}



