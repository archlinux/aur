# Maintainer: k0kubun <takashikkbn@gmail.com>
pkgname=xremap-wlroots-bin
pkgver=0.14.8
pkgrel=1
pkgdesc='Dynamic key remapper for X11 and Wayland'
url='https://github.com/k0kubun/xremap'
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-x86_64-wlroots.zip")
arch=('x86_64')
license=('MIT')
provides=('xremap')
sha256sums_x86_64=('d405dde9bc66c57f43e23c0aee3da03b0e938fa9586517b3a4a380a7579092d5')

package() {
  cd "$srcdir/"

  install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
}
