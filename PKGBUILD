# Maintainer: njkevlani <njkevlani@gmail.com>
# Maintainer: k0kubun <takashikkbn@gmail.com>
pkgname=xremap-x11-bin
pkgver=0.14.1
pkgrel=1
pkgdesc='Dynamic key remapper for X11 and Wayland'
url='https://github.com/k0kubun/xremap'
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-x86_64-x11.zip")
arch=('x86_64')
license=('MIT')
provides=('xremap')
sha256sums_x86_64=('421d21276c0070427c935f2d23a7cebb6dbdc5859ba7a9f95540f39e3fc665ff')

package() {
  cd "$srcdir/"

  install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
}
