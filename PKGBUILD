# Maintainer: Nils Kvist <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=mondo-generator
pkgver=2019.02.20.5
pkgrel=1
pkgdesc='a theme template manager and generator'
arch=('any')
url='https://github.com/budlabs/mondo'
license=('MIT')
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
source=("https://github.com/budlabs/mondo/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('ca7bed56361a66b7fd08967290d20dc0e7875e3594ff445ae87e3395321b97e9')

package() {
  ls
  cd "mondo-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
