# Maintainer: Momwhyareyouhere <momwhyareyouhere51@gmail.com>

pkgname=qelith-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Qelith programming language - prebuilt x86-64 binary"
arch=('x86_64')
url="https://github.com/Momwhyareyouhere/Qelith"
license=('MIT')
depends=('bash' 'binutils' 'glibc')
source=("qelith-bin-0.1.4.tar.gz::https://github.com/Momwhyareyouhere/Qelith/releases/download/v0.1.4/qelith-linux-x86_64.tar.gz")
sha256sums=('fab0076ba91b10528f0b251e49a19e71d7bab88eae0813e9a304b9c5a7d9e820')

package() {
  install -Dm755 bin/qelith "$pkgdir/usr/bin/qelith"
  install -Dm755 share/qelith/qelith0 "$pkgdir/usr/share/qelith/qelith0"
}
