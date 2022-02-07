# Maintainer: ZaViBiS <igordnepr27 at gmail dot com>

pkgname=ppd
pkgver=0.3
pkgrel=1
pkgdesc="calculates the percentage difference between two numbers."
url="https://github.com/ZaViBiS/Percentage-difference"
arch=("x86_64")
license=('GPL3.0')
md5sums=('9791a754f62ba3d76e861b52c31fe7ce')
sha256sum=('7e05f87a48208c4c1384ce58e97c8b3c99e59636bc16979f7d18976aab778f7d')
sha512sum=('9b27ce16c098b0e18c51705dd0560b389bebd52a8ec5c85a7dd88a54b0d64832e9d755110e3cdc047a2ea3d2c861d868d18d37be8fb0a9cb046e94f64a520896')
source=("https://github.com/ZaViBiS/Percentage-difference/releases/download/$pkgver/pd")

package() {
  install -D "$srcdir/pd" "$pkgdir/usr/bin/ppd"
}
