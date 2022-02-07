# Maintainer: ZaViBiS <igordnepr27 at gmail dot com>

pkgname=ppd
pkgver=0.3
pkgrel=1
pkgdesc="calculates the percentage difference between two numbers."
url="https://github.com/ZaViBiS/Percentage-difference"
arch=("x86_64")
license=('GPL3.0')
md5sums=('3db74550613812bcfbc230daf1aa77b3')
sha256sum=('5a2e3537996d7e2a96cefa36f5818024ae4b6b2683c8cf8db3d26bb74eb843d8')
sha512sum=('4fe53e7cf1da6922d43cd23e292482d80f064e57c0e6ffd2acf215c1a6122ff788e3c85169151356c66b99d91e4b71e0271f5dc85b292662622269902ed75242')
source=("https://github.com/ZaViBiS/Percentage-difference/releases/download/$pkgver/pd")

package() {
  install -D "$srcdir/pd" "$pkgdir/usr/bin/ppd"
}
