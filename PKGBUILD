# Maintainer: k0kubun <takashikkbn@gmail.com>
pkgname=xremap-wlroots-bin
pkgver=0.8.18
pkgrel=1
pkgdesc='Dynamic key remapper for X11 and Wayland'
url='https://github.com/k0kubun/xremap'
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-x86_64-wlroots.zip")
arch=('x86_64')
license=('MIT')
provides=('xremap')
sha256sums_x86_64=('3e24a13d4cd5d4486f5c0572eb2ad43442f29f9841bcd594be154ef12010a393')

package() {
  cd "$srcdir/"

  install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
}
