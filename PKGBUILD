# Maintainer: Mikhail Chugunkov <poslegm@gmail.com> 
pkgname=scalafmt-native
pkgver=2.0.1
pkgrel=2
pkgdesc='Code formatter for Scala built with GraalVM (for fast startup)'
arch=('x86_64')
url='https://scalameta.org/scalafmt/'
license=('Apache')
source=("https://chugunkov.website/files/scalafmt-native-2.0.1.tar.gz")
sha256sums=('5849b7805d1219affc53e7d210b8b8f2d9f591c780d5138fc7aeb82744302ddc')

package() {
  cd "$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin
  install -D -m755 scalafmt "${pkgdir}/usr/bin/scalafmt"
}

