# Maintainer: njkevlani <njkevlani@gmail.com>
pkgname=xremap-x11-bin
pkgver=0.4.2
pkgrel=1
pkgdesc='Dynamic key remapper for X11 and Wayland'
url='https://github.com/k0kubun/xremap'
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-x86_64-x11.zip")
arch=('x86_64')
license=('MIT')
provides=('xremap')
sha256sums_x86_64=('3f4cbc88939635e7363cdc7bd0bd778ffdf0a96714e42a85c929ae55371dfb79')

package() {
  cd "$srcdir/"

  install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
}
