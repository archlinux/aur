# Maintainer: njkevlani <njkevlani@gmail.com>
# Maintainer: k0kubun <takashikkbn@gmail.com>
pkgname=xremap-x11-bin
pkgver=0.10.7
pkgrel=1
pkgdesc='Dynamic key remapper for X11 and Wayland'
url='https://github.com/k0kubun/xremap'
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-x86_64-x11.zip")
arch=('x86_64')
license=('MIT')
provides=('xremap')
sha256sums_x86_64=('16ac7e5ef0ff1836301f3d57bc5061eeb73e99f9697ab864a0159c0720876d15')

package() {
  cd "$srcdir/"

  install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
}
