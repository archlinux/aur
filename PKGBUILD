# Maintainer: k0kubun <takashikkbn@gmail.com>
pkgname=xremap-hypr-bin
pkgver=0.10.8
pkgrel=1
pkgdesc='Dynamic key remapper for X11 and Wayland'
url='https://github.com/k0kubun/xremap'
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-x86_64-hypr.zip")
arch=('x86_64')
license=('MIT')
provides=('xremap')
sha256sums_x86_64=('593b03975fcd261552da6a61f85800577d55d5201edd1a491cbf50017aeee472')

package() {
  cd "$srcdir/"

  install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
}
