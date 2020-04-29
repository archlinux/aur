# Maintainer: Artur Juraszek <artur@juraszek.xyz>

pkgname=dolt-bin
pkgver=0.16.0
pkgrel=3
pkgdesc='Git for data!'
arch=('x86_64')
url='https://www.dolthub.com/'
license=('Apache')
conflicts=('dolt')
source=("$pkgname-x86_64-$pkgver.tar.gz::https://github.com/liquidata-inc/dolt/releases/download/v$pkgver/dolt-linux-amd64.tar.gz")
sha256sums=('e7b49e99207794972321302bae4d00424ca6221adc8d6443b6d6dd11f976bd8b')

package() {
  cd dolt-linux-amd64
  install -D -t $pkgdir/usr/bin/ bin/{dolt,git-dolt,git-dolt-smudge}
}
