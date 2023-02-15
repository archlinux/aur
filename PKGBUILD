# Maintainer: Hoream <2175223953@qq.com>
pkgname=totalmapper-bin
pkgver=1.3.14
pkgrel=1
pkgdesc="A simple utility for remapping keys using the Linux event handling system."
arch=(x86_64)
url="https://github.com/ellbur/totalmapper"
license=('GPL3')
depends=()
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("totalmapper-static-linux-amd64-$pkgver.tar.gz::https://github.com/ellbur/totalmapper/releases/download/v$pkgver/totalmapper-static-linux-amd64-$pkgver.tar.gz")
sha512sums=('da60c1312b6382e2171c7b99addd819c99548c1ad46c353c0b4640adeb0431f36495b6d22b0996ce5649f19168b4d25c749ca9f3b6f03e02d93f71cb5016513e')

package() {
  install -Dm755 "totalmapper-static-linux-amd64-$pkgver/totalmapper" "$pkgdir/usr/bin/totalmapper"
}
