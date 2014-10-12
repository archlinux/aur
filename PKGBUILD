# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=mongroup
pkgver=0.4.1
pkgrel=1
pkgdesc="Monitor a group of processes with mon"
arch=('any')
url="https://github.com/jgallen23/mongroup"
license=('MIT')
depends=('mon' 'bash')
source=($pkgname-$pkgver.tar.gz::"https://github.com/jgallen23/mongroup/archive/$pkgver.tar.gz")
sha256sums=('50c6fb0eb6880fa837238a2036f9bc77d2f6db8c66b8c9a041479e2771a925ae')

package() {
  cd $pkgname-$pkgver

  install -Dm755 bin/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -d "$pkgdir"/usr/share/doc/$pkgname
  cp -r example *.md "$pkgdir"/usr/share/doc/$pkgname
}
