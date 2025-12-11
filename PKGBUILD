# Maintainer: k0kubun <takashikkbn@gmail.com>
pkgname=xremap-hypr-bin
pkgver=0.14.6
pkgrel=1
pkgdesc='Dynamic key remapper for X11 and Wayland'
url='https://github.com/k0kubun/xremap'
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-x86_64-hypr.zip")
arch=('x86_64')
license=('MIT')
provides=('xremap')
sha256sums_x86_64=('fa88ed9a1b2a660ec99d2479261cbda149c9ffbcea6a9f8a17b8e4ac2e7c15ac')

package() {
  cd "$srcdir/"

  install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
}
