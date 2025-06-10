# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

pkgname=bontmia
pkgver=0.19.1
pkgrel=1
pkgdesc="Bontmia (Backup Over Network To Multiple Incremental Archives)"
arch=('x86_64')
url="https://github.com/hcartiaux/bontmia"
license=('GPL-2.0')
depends=('openssh' 'rsync')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hcartiaux/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('355c74771f4816799cb14ae972e8964839a1c765261412f7ab4fa61bc83231a5')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bontmia "$pkgdir/usr/bin/bontmia"
  install -Dm644 misc/bontmia.1 "$pkgdir/usr/share/man/man1/bontmia.1"
}

