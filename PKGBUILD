# Maintainer: k0kubun <takashikkbn@gmail.com>
pkgname=xremap-hypr-bin
pkgver=0.10.2
pkgrel=1
pkgdesc='Dynamic key remapper for X11 and Wayland'
url='https://github.com/k0kubun/xremap'
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-x86_64-hypr.zip")
arch=('x86_64')
license=('MIT')
provides=('xremap')
sha256sums_x86_64=('ac3d737b3fe0b84bee675db89bb7b4777da00999b07c4ccff43b92175be7fd0a')

package() {
  cd "$srcdir/"

  install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
}
