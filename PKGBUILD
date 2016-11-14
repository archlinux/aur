# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=envchain
pkgver=1.0.1
pkgrel=2
pkgdesc='Set environment variables with D-Bus secret service'
arch=('i686' 'x86_64')
url='https://github.com/sorah/envchain'
license=('MIT')
depends=('readline' 'libsecret')
source=("https://github.com/sorah/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('09af1fe1cfba3719418f90d59c29c081e1f22b38249f0110305b657bd306e9ae')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 envchain "$pkgdir/usr/bin/envchain"
}

# vim: set ft=sh:
