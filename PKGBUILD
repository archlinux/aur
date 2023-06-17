# Maintainer: Denis mezencevdenis@yandex.ru
pkgname="maven363"
pkgver="3.6.3"
pkgrel=1
epoch=
pkgdesc="Java project management and project comprehension tool 3.6.3 version"
arch=('any')
url="https://maven.apache.org"
license=('APACHE')
groups=()
depends=('java-environment>=7' 'bash' 'procps-ng')
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
source=("$pkgname-$pkgver.tar.gz::https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/$pkgver/apache-maven-$pkgver-bin.tar.gz")
noextract=()
md5sums=('9792c717f5845d952907d5144b8253c3')
validpgpkeys=()

build() {
	true
}

package() {
	install -dm755 "$pkgdir/opt"
	install -dm755 "$pkgdir/usr/bin"
	cp -R "$srcdir/apache-maven-$pkgver" "$pkgdir/opt/maven"
	ln -s "/opt/maven/bin/mvn" "$pkgdir/usr/bin/mvn"
}
