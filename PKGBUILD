# Maintainer: Pedro H. Lara Campos <root@pedrohlc.com>
# Thanks for archlinuxcn's package that I've used as template!

pkgname='chaotic-keyring'
pkgver='20210330'
pkgrel=1
pkgdesc='Chaotic-AUR PGP keyring'
arch=('any')
url='https://aur.chaotic.cx'
license=('GPL')
depends=('archlinux-keyring')
optdepends=('pkgstats: install to submit package usage statistics')
install="chaotic-keyring.install"
source=("keyring-$pkgver-$pkgrel.tar.gz::https://github.com/chaotic-aur/keyring/archive/$pkgver-$pkgrel.tar.gz")

package() {
  cd "$srcdir/keyring-$pkgver-$pkgrel"

  make PREFIX=/usr "DESTDIR=$pkgdir" install
}

sha512sums=('bebd11a9ed25705db44d3139a107647ec8b8247b27cd3fd1d67cfca9c280ac5830093f242ad3b08742d31950ac42286071863971af59cb5fa0318026fd176b16')
