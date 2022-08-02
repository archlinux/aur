# Maintainer: Denis mezencevdenis@yandex.ru
pkgname="node14"
pkgver="14.17.6"
pkgrel=1
epoch=
pkgdesc="node js 14"
arch=('x86_64')
url="https://github.com/mezlogo/template-aur-bin"
license=('unknown')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://nodejs.org/dist/v$pkgver/node-v$pkgver-linux-x64.tar.gz")
noextract=()
md5sums=('2f1efa5dad4a7fbf38301450e6f84054')
validpgpkeys=()

build() {
	true
}

package() {
	install -dm755 "$pkgdir/opt/node"
	install -dm755 "$pkgdir/usr/bin"
	cp -R "$srcdir/node-v$pkgver-linux-x64/." "$pkgdir/opt/node"
	ln -s "/opt/node/bin/node" "$pkgdir/usr/bin/node"
	ln -s "/opt/node/bin/npm" "$pkgdir/usr/bin/npx"
	ln -s "/opt/node/bin/npx" "$pkgdir/usr/bin/npm"
}
