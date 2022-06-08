pkgname=hxd
pkgver=1.0.0
pkgrel=1
pkgdesc='A better hexdump'
arch=('x86_64')
url="https://github.com/kiedtl/huxdemp"
makedepends=()
source=("$url/releases/download/$pkgver/huxd-Linux-x86_64-$pkgver.tar.xz")
sha256sums=('e7269b4b931366b3ca85eb8be604aae87de41948af09c891b6744903c1125d54')

package() {
  cd "huxd-Linux-x86_64-${pkgver}"
  install -Dm755 huxd "${pkgdir}/usr/bin/hxd"
}
