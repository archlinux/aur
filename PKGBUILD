# Maintainer: Pedro H. Lara Campos <root@pedrohlc.com>
# Thanks for archlinuxcn's package that I've used as template!

pkgname='chaotic-keyring'
pkgver='20200912'
pkgrel=2
pkgdesc='Chaotic-AUR PGP keyring'
arch=('any')
url='https://lonewolf.pedrohlc.com/chaotic-aur'
license=('GPL')
depends=('archlinux-keyring')
optdepends=('pkgstats: install to submit package usage statistics')
install="chaotic-keyring.install"
source=("keyring-$pkgver-$pkgrel.tar.gz::https://github.com/chaotic-aur/keyring/archive/$pkgver-$pkgrel.tar.gz")

package() {
  cd "$srcdir/keyring-$pkgver-$pkgrel"

  make PREFIX=/usr "DESTDIR=$pkgdir" install
}

sha512sums=('1ac37dff6605850cbacc40864c3d0a4052a4f1d1f873961e1be94dd3bd8c3cc477d20272eda88ef93e7c1e8bb8513aac4a5a30bcf99317e3c6f34df82799ad6e')
