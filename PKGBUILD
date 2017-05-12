# Maintainer: Aurélien Ooms <aurelien.ooms@gmail.com>
pkgname=ulb
pkgver=1.0.2
pkgrel=1
epoch=
pkgdesc="Scripts for use @ Université libre de Bruxelles"
arch=(any)
url="https://github.com/aureooms-ulb/${pkgname}"
license=('AGPL-3.0')
groups=()
depends=('bash' 'coreutils' 'wget' 'perl' 'grep' 'fping' 'iproute2')
makedepends=('git')
checkdepends=()
optdepends=('pass')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://github.com/aureooms-ulb/${pkgname}/archive/v${pkgver}.tar.gz")
noextract=()
md5sums=('SKIP')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
