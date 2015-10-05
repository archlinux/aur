# Maintainer: Stavros Polymenis <sp@orbitalfox.com>
pkgname=portal
pkgver=0.1.1
pkgrel=1
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
md5sums=('ca4a222928203019be0aab260e342def')

build() {
#  cd "$pkgname-$pkgver"
#  ./configure --prefix=/usr
#  make
true
}

package() {
	install -Dm544 portal-postconf "$pkgdir/usr/bin/portal-postconf"
}
