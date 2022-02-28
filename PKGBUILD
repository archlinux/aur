# Maintainer: njkevlani <njkevlani@gmail.com>
pkgname=xremap-x11-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Dynamic key remapper for X11 and Wayland'
url='https://github.com/k0kubun/xremap'
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-x86_64-x11.zip")
arch=('x86_64')
license=('MIT')
provides=('xremap')
sha256sums_x86_64=('9e46fd7c187934a42a0d35b6a9e0613f4f685b50b7fed39feb3266b209a0cd0c')

package() {
  cd "$srcdir/"

  install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
}
