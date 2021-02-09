# Maintainer: Ivan Smolyakov <smol.ivan97@gmail.com>

pkgname=mcron
pkgver=1.2.0
pkgrel=1
pkgdesc="This is a tool to run jobs at scheduled times. It is a complete replacement for Vixie cron."
url="https://www.gnu.org/software/mcron/"
arch=('x86_64')
license=("GPL3")
depends=('guile')
makedepends=()
conflicts=('cron') 
source=("$pkgname-$pkgver.tar.gz::https://ftp.gnu.org/gnu/mcron/${pkgname}-${pkgver}.tar.gz")
md5sums=('3617a5bf67e30dc009c62f6e831e7764')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix ${pkgdir}/usr/
  make
 
}

package() {
  cd "$pkgname-$pkgver"

  make install
}
