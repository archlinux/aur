# Maintainer: k0kubun <takashikkbn@gmail.com>
pkgname=xremap-hypr-bin
pkgver=0.13.0
pkgrel=1
pkgdesc='Dynamic key remapper for X11 and Wayland'
url='https://github.com/k0kubun/xremap'
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-x86_64-hypr.zip")
arch=('x86_64')
license=('MIT')
provides=('xremap')
sha256sums_x86_64=('6c01e43ce962bbf9800c7ff28c46c671eee40d17a1f0c24984d3c5a8d556f65c')

package() {
  cd "$srcdir/"

  install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
}
