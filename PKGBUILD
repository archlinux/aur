# Maintainer: Mikhail Chugunkov <poslegm@gmail.com> 
pkgname=scalafmt-native
pkgver=2.0.0.RC6
pkgrel=2
pkgdesc='Code formatter for Scala built with GraalVM (for fast startup)'
arch=('x86_64')
url='https://scalameta.org/scalafmt/'
license=('Apache')
source=("https://chugunkov.website/files/scalafmt-native-2.0.0.RC6.tar.gz")
sha256sums=('772260f561b0a9ed38b67cff383f20bc78ccd924a7cee26af46418b63a4c6a61')

package() {
  cd "$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin
  install -D -m755 scalafmt "${pkgdir}/usr/bin/scalafmt"
}

