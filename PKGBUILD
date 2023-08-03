# Maintainer: njkevlani <njkevlani@gmail.com>
pkgname=xremap-hypr-bin
pkgver=0.8.6
pkgrel=1
pkgdesc='Dynamic key remapper for X11 and Wayland'
url='https://github.com/k0kubun/xremap'
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-x86_64-hypr.zip")
arch=('x86_64')
license=('MIT')
provides=('xremap')
sha256sums_x86_64=('2ff7960909d48ab3566fab016607d9e6bdc872385e44b08d6c363baf7cdf22be')

package() {
  cd "$srcdir/"

  install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
}
