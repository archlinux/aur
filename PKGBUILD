# Maintainer: k0kubun <takashikkbn@gmail.com>
pkgname=xremap-wlroots-bin
pkgver=0.10.2
pkgrel=1
pkgdesc='Dynamic key remapper for X11 and Wayland'
url='https://github.com/k0kubun/xremap'
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-x86_64-wlroots.zip")
arch=('x86_64')
license=('MIT')
provides=('xremap')
sha256sums_x86_64=('e246c13fe912d1e4204fd8d3f5b77761fa790da13b94a099236b8a67df73e271')

package() {
  cd "$srcdir/"

  install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
}
