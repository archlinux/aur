# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

pkgname=bontmia
pkgver=0.19
pkgrel=1
pkgdesc="Bontmia (Backup Over Network To Multiple Incremental Archives)"
arch=('x86_64')
url="https://github.com/hcartiaux/bontmia"
license=('GPL-2.0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hcartiaux/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4b9199835dfe8ecbb7e142f646e3fd70175ef68112b4b3e5a6b874a4898f18c0')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bontmia "$pkgdir/usr/bin/bontmia"
  install -Dm644 misc/bontmia.1 "$pkgdir/usr/share/man/man1/bontmia.1"
}

