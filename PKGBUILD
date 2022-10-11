# Maintainer: njkevlani <njkevlani@gmail.com>
pkgname=xremap-x11-bin
pkgver=0.7.6
pkgrel=1
pkgdesc='Dynamic key remapper for X11 and Wayland'
url='https://github.com/k0kubun/xremap'
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-x86_64-x11.zip")
arch=('x86_64')
license=('MIT')
provides=('xremap')
sha256sums_x86_64=('e38f39313a142f04c7a589261637316c99d8910e56c92b3fca6cdcb0a3adb097')

package() {
  cd "$srcdir/"

  install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
}
