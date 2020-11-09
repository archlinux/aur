# Maintainer: WiRight <ruslan.mahin1@gmail.com>
# Dizoft Team

pkgname=drpc
pkgver=1.0.0
pkgrel=0
pkgdesc="JsonRPC cli client. Small and faster"
arch=('x86_64')
url="https://github.com/DizoftTeam/dron"
license=('Apache')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DizoftTeam/$pkgname/archive/$pkgver.tar.gz")
md5sums=('6a3da507c299b9e5abfee97bd685423b')

build() {
  cd "$pkgname-$pkgver"
  go build -o drpc ./main.go
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/"drpc "$pkgdir"/usr/local/bin/drpc
}
