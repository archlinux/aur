# Maintainer: Nils Kvist  <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=linklord
pkgver=2020.01.07.04
pkgrel=4
pkgdesc='budlabs markdown flavored link manager'
arch=('any')
url='https://github.com/budlabs/linklord'
license=('BSD')
groups=()
depends=('bash>=4.0.0')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/budlabs/linklord/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('5f65739b713d394b114f13443dbe9fceb81cfeaf4bfa3fda09d51dea059d0a48')

package() {
  ls
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
