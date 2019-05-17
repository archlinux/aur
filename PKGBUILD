# Maintainer: Mikhail Chugunkov <poslegm@gmail.com> 
pkgname=scalafmt-native
pkgver=2.0.0.RC7
pkgrel=1
pkgdesc='Code formatter for Scala built with GraalVM (for fast startup)'
arch=('x86_64')
url='https://scalameta.org/scalafmt/'
license=('Apache')
source=("https://chugunkov.website/files/scalafmt-native-2.0.0.RC7.tar.gz")
sha256sums=('226af318ec1a5b8d88bd49b10ac7667589de4b1150ea0d1d13cde6e0a532696b')

package() {
  cd "$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin
  install -D -m755 scalafmt "${pkgdir}/usr/bin/scalafmt"
}

