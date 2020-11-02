# Maintainer: Antonio Tauro <eye at eyenx.ch>
pkgname=whalebrew
pkgver=0.2.4
pkgrel=2
pkgdesc="Homebrew, but with Docker images"
arch=('x86_64')
url="https://github.com/bfirsh/whalebrew"
license=('Apache License 2.0')
provides=('whalebrew')
depends=('docker')
conflicts=('whalebrew')
source=("https://github.com/bfirsh/whalebrew/releases/download/${pkgver}/whalebrew-Linux-x86_64")
md5sums=('61211904516fe3cdbc8036088879f233')
sha256sums=('f83edd08a197f666981f34c61b8c39929296169b637afc96d2ea0ac0ea8a3235')

package() {
  install -D -m755 "$srcdir"/whalebrew-Linux-x86_64 "$pkgdir/usr/bin/whalebrew"
}
