# Maintainer: Mikhail Chugunkov <poslegm@gmail.com> 
pkgname=scalafmt-native
pkgver=2.0.0
pkgrel=1
pkgdesc='Code formatter for Scala built with GraalVM (for fast startup)'
arch=('x86_64')
url='https://scalameta.org/scalafmt/'
license=('Apache')
source=("https://chugunkov.website/files/scalafmt-native-2.0.0.tar.gz")
sha256sums=('fd806760433cc5e3a98dde52593c8181620e1b1c977be56687f329e6adf99545')

package() {
  cd "$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin
  install -D -m755 scalafmt "${pkgdir}/usr/bin/scalafmt"
}

