# Maintainer: ZaViBiS <igordnepr27 at gmail dot com>

pkgname=ppd
pkgver=0.2
pkgrel=1
pkgdesc="calculates the percentage difference between two numbers."
url="https://github.com/ZaViBiS/Percentage-difference"
arch=("x86_64")
license=('GPL3.0')
md5sums=("501e8fcb323e14e254cc106e62b39f1e")
sha256sum=('9fc7be8876cbd9fa23e5e6e18207c1ce10a41889ecea1144d1f5d7dff77a4cf9')
sha512sum=('721bde5ae13596a74ecd2646571d35c4ba5c5ad945158affc2df2eb72d358397ada645c330bbbc00e8a88cbcbe7fc3699bbc9ccb6bce92dd583a59eb23d12efd')
source=("https://github.com/ZaViBiS/Percentage-difference/releases/download/$pkgver/pd")

package() {
  install -D "$srcdir/pd" "$pkgdir/usr/bin/ppd"
}
