# Maintainer: ZaViBiS <igordnepr27 at gmail dot com>

pkgname=pd
pkgver=0.1
pkgrel=1
pkgdesc="calculates the percentage difference between two numbers."
url="https://github.com/ZaViBiS/Percentage-difference"
arch=("x86_64")
license=('GPL3.0')
md5sums=("bf2d42af3bb29110f888d71c3c22c01c")
sha256sum=('ba52037497de84a3a42c3516ae16349496fb551fb997bfc6758a437ff194915a')
sha512sum=('7bf02914cbf50f93960dfd035e6155eb4521d18b480a825505e06e37f46616a12e3785293f3c7b8c0e9e549f9303c9f62c3878908d8fe18a71a89c690c204740')
source=("https://github.com/ZaViBiS/Percentage-difference/releases/download/$pkgver/pd")

package() {
  install -D "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
