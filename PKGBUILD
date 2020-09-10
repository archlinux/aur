# Maintainer: Artur Juraszek <artur@juraszek.xyz>

pkgname=dolt-bin
pkgver=0.19.1
pkgrel=1
pkgdesc='Git for data!'
arch=('x86_64')
url='https://www.dolthub.com/'
license=('Apache')
conflicts=('dolt')
source=("$pkgname-x86_64-$pkgver.tar.gz::https://github.com/liquidata-inc/dolt/releases/download/v$pkgver/dolt-linux-amd64.tar.gz")
sha256sums=('99ebaa43ad6990285f39f9eeb1561b2ca570faf5071420d6f63da89ec2e398cb')

package() {
  cd dolt-linux-amd64
  install -D -t $pkgdir/usr/bin/ bin/{dolt,git-dolt,git-dolt-smudge}
}
