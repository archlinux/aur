# Stub PKGBUILD to reserve package name
pkgname=oa-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="OA - High-performance C++ library for ML, audio, and compute (pre-built binaries)"
arch=(x86_64)
url="https://github.com/empyrealm/oa"
license=(MIT)
depends=()
source=("https://github.com/empyrealm/oa/releases/download/v${pkgver}/oa-${pkgver}-linux-x86_64.tar.gz")
sha256sums=()

package() {
  mkdir -p "$pkgdir"/usr
  cp -r usr/* "$pkgdir"/usr/
}
