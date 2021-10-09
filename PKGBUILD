# Maintainer: Arjun Vikram <`echo moc.liamg%rua+kivjra | rev | tr '%' '@'`>

_name=secret-service
pkgname=$_name-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Service to keep secrets of applications. Implements  FreeDesktop Secret Service API"
arch=('x86_64')
url="https://github.com/yousefvand/secret-service"
license=('MIT')
provides=('secret-service')
conflicts=('secret-service')
depends=()
optdepends=()
source=("https://github.com/yousefvand/$_name/releases/download/v$pkgver/secretserviced-v$pkgver.tar.gz")
sha256sums=('fc5ea442139f8ea4a5c85cf7694b397aafb2d75d389ff8c16c3fd82f69a7d593')

package() {
	mkdir -p "${pkgdir}/usr/bin"
	chmod 755 secretserviced
	cp secretserviced "${pkgdir}/usr/bin/secretserviced"
}
