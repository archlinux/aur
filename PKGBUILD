# Maintainer: k0kubun <takashikkbn@gmail.com>
pkgname=xremap-hypr-bin
pkgver=0.10.17
pkgrel=1
pkgdesc='Dynamic key remapper for X11 and Wayland'
url='https://github.com/k0kubun/xremap'
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-x86_64-hypr.zip")
arch=('x86_64')
license=('MIT')
provides=('xremap')
sha256sums_x86_64=('0d21ede119354b66861d6b8df0fc042608901b679259aa34eb217538697d0a5a')

package() {
  cd "$srcdir/"

  install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
}
