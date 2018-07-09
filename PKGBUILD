# Maintainer: Nils Kvist <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=dunstmerge
pkgver=0.0.4
pkgrel=1
pkgdesc='Dunst layout manager'
arch=('any')
url='https://github.com/budlabs/dunstmerge'
license=('GPL3')
groups=()
depends=('dunst' 'bash>=4.0.0')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/budlabs/$pkgname/archive/v.$pkgver.tar.gz")
noextract=()
sha256sums=('314ba94bf4e96045e7ebc4dc53dcbbdd06e26adfd413b84301422ca14313a47d')

package() {
  cd "$pkgname-v.$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
