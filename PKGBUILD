# Maintainer: Aurélien Ooms <aurelien.ooms@gmail.com>
pkgname=spqr
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="Generate a QR code payload for initiating a SEPA transfer"
arch=(any)
url="https://github.com/aureooms/spqr"
license=('AGPL-3.0')
groups=()
depends=('grep' 'sed' 'bc')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://github.com/aureooms/spqr/archive/v${pkgver}.tar.gz")
noextract=()
md5sums=('SKIP')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
