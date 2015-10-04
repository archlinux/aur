# Maintainer: Stavros Polymenis <sp@orbitalfox.com>
pkgname=portal
pkgver=0.1.0
pkgrel=2
pkgdesc="A personal portal system"
arch=(any)
url="http://orbitalfox.com"
license=('LGPL3')
groups=()
depends=(postfix dovecot nginx)
makedepends=()
optdepends=(yamado)
provides=("portal")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(#"git+https://github.com/orbifx/portal.git"
	https://github.com/orbifx/portal/releases/download/v0.1-beta/portal-postconf.tar.gz)
noextract=()
md5sums=('ea060b28005b3eb2d5f54c9556ff72e9')

build() {
#  cd "$pkgname-$pkgver"
#  ./configure --prefix=/usr
#  make
true
}

package() {
	install -Dm544 portal-postconf "$pkgdir/usr/bin/portal-postconf"
}
