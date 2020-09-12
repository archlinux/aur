# Maintainer: Pedro H. Lara Campos <root@pedrohlc.com>
# Thanks for archlinuxcn's package that I've used as template!

pkgname='chaotic-keyring'
pkgver='20200912'
pkgrel=1
pkgdesc='Chaotic-AUR PGP keyring'
arch=('any')
url='https://lonewolf.pedrohlc.com/chaotic-aur'
license=('GPL')
depends=('archlinux-keyring')
optdepends=('pkgstats: install to submit package usage statistics')
install="chaotic-keyring.install"
source=("keyring.tar.gz::https://github.com/chaotic-aur/keyring/archive/$pkgver-$pkgrel.tar.gz")

package() {
  cd "$srcdir/keyring-$pkgver-$pkgrel"

  make PREFIX=/usr "DESTDIR=$pkgdir" install
}

sha512sums=('828472fec1dd8a75703af864087180702cb91c4aee3124b844a5a6fbd690c9a9250143792ca5479b5cd6da87cdcf2b216de72431029a78be0ee1c21d7932d7de')
