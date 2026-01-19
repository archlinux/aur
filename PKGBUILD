# Maintainer: yuzujr <15568103056@163.com>

pkgname=ani2xcursor-bin
_pkgname=ani2xcursor
pkgver=1.3.0
pkgrel=1
pkgdesc="Convert Windows animated cursor themes to Linux Xcursor format (prebuilt binary)"
arch=('x86_64')
url="https://github.com/yuzujr/ani2xcursor"
license=('MIT')
depends=('glibc')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-v${pkgver}-linux-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x86_64.tar.gz")
sha256sums=('36945006033dd43017f190a3c878f28808f40f89914d6a24000cc1ffa5dd92e3')

package() {
  cd "$srcdir"

  install -Dm755 ani2xcursor "$pkgdir/usr/bin/ani2xcursor"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/ani2xcursor/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/ani2xcursor/README.md"
}
