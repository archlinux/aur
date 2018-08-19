# Maintainer: Aurélien Ooms <aurelien.ooms@gmail.com>
pkgname=ovh-api-client
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="A bash client for OVH API"
arch=(any)
url="https://github.com/aureooms/${pkgname}"
license=()
groups=()
depends=('bash' 'coreutils' 'curl' 'jq')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://github.com/aureooms/${pkgname}/archive/v${pkgver}.tar.gz")
noextract=()
md5sums=('SKIP')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
