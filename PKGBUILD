# Maintainer: WiRight <ruslan.mahin1@gmail.com>
# Dizoft Team

pkgname=dron
pkgver=1.3.0
pkgrel=0
pkgdesc="Small command line shell executor"
arch=('x86_64')
url="https://github.com/DizoftTeam/dron"
license=('Apache')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DizoftTeam/$pkgname/archive/$pkgver.tar.gz")
md5sums=('3463cd14b85e980120fb77b9c0a93e62')

build() {
  cd "$pkgname-$pkgver"
  go build -o dron ./main.go
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/"dron "$pkgdir"/usr/local/bin/dron
}
