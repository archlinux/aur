# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=alacryd
pkgver=0.0.3
pkgrel=1
pkgdesc="Expedient Perl6 module installation"
arch=('any')
depends=('perl6')
groups=('perl6')
url="https://github.com/atweiden/alacryd"
license=('UNLICENSE')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/atweiden/$pkgname/tar.gz/$pkgver)
sha256sums=('0d7d3dfcd290b51246d68184a5a5c86e516f21447a0297e7be184f090d9b9376')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 UNLICENSE -t "$pkgdir/usr/share/licenses/alacryd"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/alacryd"

  msg2 'Installing...'
  install -Dm 755 alacryd -t "$pkgdir/usr/bin"
}
