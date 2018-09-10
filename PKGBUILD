# Maintainer: Nils Kvist <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=mondo-generator
pkgver=0.1.4
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
source=("https://github.com/budlabs/mondo/archive/v.$pkgver.tar.gz")
noextract=()
sha256sums=('efb08de7992f21c6d7d77a8feff92e9ed22e94a4619b647558bd0aadb59e4f85')

package() {
  cd "mondo-v.$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
