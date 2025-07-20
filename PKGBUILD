pkgname=xray-knife-bin
pkgver=6.62
pkgrel=1
pkgdesc="Swiss‑army CLI for xray‑core & sing‑box (prebuilt binary)"
arch=('x86_64')
url="https://github.com/lilendian0x00/xray-knife"
license=('MIT')
depends=('glibc')
provides=('xray-knife')
conflicts=('xray-knife')

source=("xray-knife.zip::https://github.com/lilendian0x00/xray-knife/releases/latest/download/Xray-knife-linux-64.zip")
sha256sums=('SKIP')  # Or replace with real checksum

package() {
  install -Dm755 xray-knife "$pkgdir/usr/bin/xray-knife"
}

