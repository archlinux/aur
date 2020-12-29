# Maintainer: Pedro H. Lara Campos <root@pedrohlc.com>
# Thanks for archlinuxcn's package that I've used as template!

pkgname='chaotic-keyring'
pkgver='20201229'
pkgrel=1
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

sha512sums=('067e55485bdac61b8bfb1aca0da4d06b370eab63bb81120ce7bf0f736c71560455d7238fa7cc56da6f563e9f6dae9e6279a993d97bb98766eb7ebca1694f4416')

