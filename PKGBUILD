# Maintainer: k0kubun <takashikkbn@gmail.com>
pkgname=xremap-wlroots-bin
pkgver=0.10.1
pkgrel=1
pkgdesc='Dynamic key remapper for X11 and Wayland'
url='https://github.com/k0kubun/xremap'
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-x86_64-wlroots.zip")
arch=('x86_64')
license=('MIT')
provides=('xremap')
sha256sums_x86_64=('63b3b2b4b82eb04f3cc516d824ab50b7ce4079b870168706e99eda215a801014')

package() {
  cd "$srcdir/"

  install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
}
