# Maintainer: njkevlani <njkevlani@gmail.com>
# Maintainer: k0kubun <takashikkbn@gmail.com>
pkgname=xremap-x11-bin
pkgver=0.8.14
pkgrel=1
pkgdesc='Dynamic key remapper for X11 and Wayland'
url='https://github.com/k0kubun/xremap'
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-x86_64-x11.zip")
arch=('x86_64')
license=('MIT')
provides=('xremap')
sha256sums_x86_64=('a71f05d5d3fddc59d2e17fa98609b19388bd9a03a5f0c87cdf8bed5c466d7491')

package() {
  cd "$srcdir/"

  install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
}
