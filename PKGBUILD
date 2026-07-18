# Maintainer: Zaid Ejjo <zaid@example.com>
# Contributor: Zaid Ejjo <zaid@example.com>

pkgname=ax
pkgver=0.1.0
pkgrel=1
pkgdesc="ax — TUI API Client: a terminal-based HTTP client with xh/httpie-style syntax parsing"
arch=('x86_64' 'aarch64')
url="https://github.com/zaidejjo/ax"
license=('MIT')
depends=('glibc')
optdepends=('xclip: X11 clipboard support'
  'wl-clipboard: Wayland clipboard support')
source_x86_64=("${url}/releases/download/v${pkgver}/ax_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/ax_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('43c1ee327926cc6e37e0a9fc9732683020da51144a891d554e380a563053cfe8')
sha256sums_aarch64=('43c1ee327926cc6e37e0a9fc9732683020da51144a891d554e380a563053cfe8')

package() {
  cd "${srcdir}"

  install -Dm755 ax "${pkgdir}/usr/bin/ax"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
