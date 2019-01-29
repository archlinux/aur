# Maintainer: Mikhail Chugunkov <poslegm@gmail.com> 
pkgname=scalafmt-native
pkgver=2.0.0.RC4
pkgrel=1
pkgdesc='Code formatter for Scala built with GraalVM (for fast startup)'
arch=('x86_64')
url='https://scalameta.org/scalafmt/'
license=('Apache')
source=("https://chugunkov.website/files/scalafmt-native-2.0.0.RC4.tar.gz")
sha256sums=('deefaa75b5363872f1f8da5d2a881db3a8cb05df6692989b450963b79a7b6efd')

package() {
  cd "$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin
  install -D -m755 scalafmt "${pkgdir}/usr/bin/scalafmt"
}

