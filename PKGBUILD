# Maintainer: Dexield
pkgname=arch-quiz
pkgver=0.1.0
pkgrel=1
pkgdesc="Arch Linux trivia quiz game"
arch=('x86_64')
url="https://github.com/dexield/arch-quiz"
license=('MIT')
depends=('glibc')
source=("$pkgname-$pkgver-x86_64.tar.gz::http://dexieldvpn.ddns.net/arch-quiz-$pkgver-x86_64.tar.gz")
sha256sums=('da155cb2246b74bf36058de51a0938a584571368d990005256b0040b38688d51')

package() {
  cd "$srcdir"
  install -Dm755 "arch-quiz" "$pkgdir/usr/bin/arch-quiz"
}
