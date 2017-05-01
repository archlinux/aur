# Maintainer: Aurélien Ooms <aurelien.ooms@gmail.com>
pkgname=gitdns
pkgver=1.0.2
pkgrel=1
epoch=
pkgdesc="Easy DNS via git"
arch=(any)
url="https://github.com/aureooms/${pkgname}"
license=('AGPL-3.0')
groups=()
depends=('bash' 'coreutils' 'jq' 'inetutils' 'myip' 'gitkv')
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
