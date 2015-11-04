# Maintainer: Alexis Viguié <alexis.viguie@epitech.eu>
pkgname=blih
pkgver=1.7
pkgrel=1
pkgdesc="Bocal Lighteweight Interface for Humans, git repositories and SSH public keys management tool for EPITECH students"
arch=('any')
url="https://intra-bocal.epitech.eu"
license=('GPL')
groups=()
depends=('python>=3.3.0' 'python-requests')
makedepends=()
optdepends=()
provides=('blih')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://pkg.blinux.fr/pub/$pkgname/$pkgver/$pkgname-$pkgver.tgz)
noextract=()
md5sums=('8d737cc043bcd2217cfb89ab84882ceb')

build() {
  cd "$pkgname-$pkgver"
  cat blih.py | sed -e s/python3.3/python/ > blih
  chmod 755 blih
}

package() {
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/bin
  cp "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin"
}
