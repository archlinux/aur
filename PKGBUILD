# Maintainer: njkevlani <njkevlani@gmail.com>
pkgname=xremap-x11-bin
pkgver=0.3.2
pkgrel=1
pkgdesc='Dynamic key remapper for X11 and Wayland'
url='https://github.com/k0kubun/xremap'
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-x86_64-x11.zip")
arch=('x86_64')
license=('MIT')
provides=('xremap')
sha256sums_x86_64=('d022b01df5a632df48a74b0edace213fb8375b4125a6917ce07bfe04a823f91c')

package() {
  cd "$srcdir/"

  install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
}
