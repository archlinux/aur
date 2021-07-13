# Maintainer: Arjun Vikram <`echo moc.liamg%rua+kivjra | rev | tr '%' '@'`>

_name=secret-service
pkgname=$_name-bin
pkgver=0.1.0
pkgrel=2
pkgdesc="Service to keep secrets of applications. Implements  FreeDesktop Secret Service API"
arch=('x86_64')
url="https://github.com/yousefvand/secret-service"
license=('MIT')
provides=('secret-service')
conflicts=('secret-service')
depends=()
optdepends=()
source=("https://github.com/yousefvand/$_name/files/6727911/secretserviced-v$pkgver.tar.gz")
sha256sums=('29da13c091427ff64e04a52b10664fc9c4788c6eef4b4a06c1ad7ec8f71a1038')

package() {
	mkdir -p "${pkgdir}/usr/bin/secretserviced"
	chmod 755 secretserviced
	cp secretserviced "${pkgdir}/usr/bin/secretserviced"
}
