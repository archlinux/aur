# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

pkgname=bontmia
pkgver=0.18.3
pkgrel=1
pkgdesc="Bontmia (Backup Over Network To Multiple Incremental Archives)"
arch=('x86_64')
url="https://github.com/hcartiaux/bontmia"
license=('GPL-2.0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hcartiaux/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6d787f531bcb3ebd3741c2c270d21117559bf84cbec833d7395dc4c859ede361')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bontmia "$pkgdir/usr/bin/bontmia"
  install -Dm644 misc/bontmia.1 "$pkgdir/usr/share/man/man1/bontmia.1"
}

