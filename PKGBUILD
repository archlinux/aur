# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=alacryd
pkgver=0.0.4
pkgrel=1
pkgdesc="Expedient Perl6 module installation"
arch=('any')
depends=('perl6')
groups=('perl6')
url="https://github.com/atweiden/alacryd"
license=('UNLICENSE')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/atweiden/$pkgname/tar.gz/$pkgver)
sha256sums=('6e511a82a56a30ab86d3bea3db14c7b4bc1a69c05804d96d6cebcc093ae4b3a9')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 UNLICENSE -t "$pkgdir/usr/share/licenses/alacryd"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/alacryd"

  msg2 'Installing...'
  install -Dm 755 alacryd -t "$pkgdir/usr/bin"
}
