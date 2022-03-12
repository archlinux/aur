# Maintainer: Denis mezencevdenis@yandex.ru
pkgname="template-for-java-cli-app-github-integrated-aur"
pkgver="0.0.6"
pkgrel=1
epoch=
pkgdesc="Template for creating aur package"
arch=('x86_64')
url="https://github.com/mezlogo/template-for-java-cli-app-github-integrated-aur"
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
source=("$pkgname-$pkgver.zip::https://github.com/mezlogo/template-for-java-cli-app-github-integrated/releases/download/v$pkgver/mycliapp.zip")
noextract=()
md5sums=('628d58c794965142b06fe8600ac08f2b')
validpgpkeys=()

build() {
	true
}

package() {
	install -dm755 "$pkgdir/opt/mycliapp/bin"
	install -dm755 "$pkgdir/usr/bin"
	cp -R "$srcdir/mycliapp/lib" "$pkgdir/opt/mycliapp/lib"
	install -Dm755 "$srcdir/mycliapp/bin/mycliapp" "$pkgdir/opt/mycliapp/bin/mycliapp"
	ln -s "/opt/mycliapp/bin/mycliapp" "$pkgdir/usr/bin/mycliapp"
}
