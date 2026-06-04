# Stub PKGBUILD to reserve package name
pkgname=oa-sdk-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="OA SDK - Development headers and libraries for OA (pre-built binaries)"
arch=(x86_64)
url="https://github.com/empyrealm/oa"
license=(MIT)
depends=(oa-bin)
source=("https://github.com/empyrealm/oa/releases/download/v${pkgver}/oa-sdk-${pkgver}-linux-x86_64.tar.gz")
sha256sums=()

package() {
  mkdir -p "$pkgdir"/usr
  cp -r usr/* "$pkgdir"/usr/
}
