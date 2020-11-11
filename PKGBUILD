# Maintainer: Aurélien Ooms <aurelien.ooms@gmail.com>
pkgname=qrap
pkgver=1.1.1
pkgrel=1
epoch=
pkgdesc="Generate a QR code payload for WiFi access point credentials"
arch=(any)
url="https://github.com/aureooms/qrap"
license=('AGPL-3.0')
groups=()
depends=('sed')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://github.com/aureooms/qrap/archive/v${pkgver}.tar.gz")
noextract=()
md5sums=('SKIP')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
