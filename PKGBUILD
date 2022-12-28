# Maintainer: njkevlani <njkevlani@gmail.com>
pkgname=xremap-x11-bin
pkgver=0.7.15
pkgrel=1
pkgdesc='Dynamic key remapper for X11 and Wayland'
url='https://github.com/k0kubun/xremap'
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-x86_64-x11.zip")
arch=('x86_64')
license=('MIT')
provides=('xremap')
sha256sums_x86_64=('2b6e8d001507aaec3645f3e431c495cc3e6fe84d23d107ee04d53457e790b4f0')

package() {
  cd "$srcdir/"

  install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
}
