# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=envchain
pkgver=1.1.0
pkgrel=1
pkgdesc='Set environment variables with D-Bus secret service'
arch=('x86_64' 'aarch64')
url='https://github.com/sorah/envchain'
license=('MIT')
depends=('readline' 'libsecret')
source=("https://github.com/sorah/$pkgname/archive/v$pkgver.tar.gz")

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 envchain "$pkgdir/usr/bin/envchain"
}

sha256sums=('832bcf58037db6187f7327282e347e45627ea617c2e09a9e6d18629e7310fff9')
