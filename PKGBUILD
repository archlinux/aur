# Maintainer: k0kubun <takashikkbn@gmail.com>
pkgname=xremap-wlroots-bin
pkgver=0.14.10
pkgrel=1
pkgdesc='Dynamic key remapper for X11 and Wayland'
url='https://github.com/k0kubun/xremap'
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-x86_64-wlroots.zip")
arch=('x86_64')
license=('MIT')
provides=('xremap')
sha256sums_x86_64=('3a30ef79a74e3891f0024b70a2cfc1faec09d43db0824ca3ab9cce0a24fca6f9')

package() {
  cd "$srcdir/"

  install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
}
