# Maintainer: David Población Criado <davidpblcrd@protonmail.com>
pkgname=incidenciascyl-cli
pkgver=1.0
pkgrel=1
pkgdesc="Programa de terminal para ver las incidencias en carreteras de Castilla y León "
arch=('any')
url="https://github.com/davidpob99/incidenciascyl-cli"
license=('Apache')
depends=('jsoncpp' 'libcurl-gnutls')
source=("https://github.com/davidpob99/incidenciascyl-cli/archive/v1.0.tar.gz")
md5sums=('e8913163ed15e789034fc8c9c356b96a')

package() {
	cd "$pkgbase-$pkgver"
	g++ -std=c++11 main.cpp -ljsoncpp -lcurl -o incidenciascyl-cli		
	install -Dm755 incidenciascyl-cli /$pkgdir/usr/bin/incidenciascyl-cli
}
