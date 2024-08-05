# Maintainer: Anže Pintar <anze@anzepintar.com>

pkgname=easyindex-cli-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="Easyindex-cli makes super easy to use Google Index API and IndexNow API"
arch=('x86_64')
url="https://github.com/usk81/easyindex-cli"
license=('MIT')
depends=()
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/usk81/easyindex-cli/releases/download/v$pkgver/easyindex-cli_${pkgver}_linux_amd64.tar.gz")
sha256sums=('5b50e5294f6786ed2885b589ceb74f34cb9cad401f4be7b03c674cfb6ab542b7')

package() {
	cd "$srcdir"
	install -Dm755 easyindex-cli "$pkgdir/usr/bin/easyindex-cli"
}
