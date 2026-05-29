# Maintainer: Momwhyareyouhere <momwhyareyouhere51@gmail.com>

pkgname=qelith-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Qelith programming language - prebuilt x86-64 binary"
arch=('x86_64')
url="https://github.com/Momwhyareyouhere/Qelith"
license=('MIT')
depends=('bash' 'binutils' 'glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Momwhyareyouhere/Qelith/releases/download/v$pkgver/qelith-linux-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
  install -Dm755 bin/qelith "$pkgdir/usr/bin/qelith"
  install -Dm755 share/qelith/qelith0 "$pkgdir/usr/share/qelith/qelith0"
}
