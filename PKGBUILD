# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=alacryd
pkgver=0.0.1
pkgrel=1
pkgdesc="Expedient Perl 6 module installation"
arch=('any')
depends=('rakudo')
url="https://github.com/atweiden/alacryd"
license=('UNLICENSE')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/atweiden/$pkgname/tar.gz/$pkgver)
sha256sums=('fbc64d60f79fadb70381a0b4ae375237fcd57b8181af04991886fd027b4844c8')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 UNLICENSE -t "$pkgdir/usr/share/licenses/alacryd"

  msg2 'Installing documentation...'
  install -Dm 644 README.pod -t "$pkgdir/usr/share/doc/alacryd"

  msg2 'Installing...'
  install -Dm 755 alacryd -t "$pkgdir/usr/bin"
}
