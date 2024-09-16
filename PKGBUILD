# Maintainer: Nicolas Gouttefangeas <ngou0210@gmail.com>
pkgname=filecrab-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A CLI to share files and text with Filecrab"
arch=('x86_64')
url="https://github.com/NicolasGB/filecrab"
license=('MIT')
depends=('gcc-libs' 'openssl')
provides=('filecrab')
conflicts=('filecrab')
source=("https://github.com/NicolasGB/filecrab/releases/download/v${pkgver}/filecrab-v${pkgver}.tgz")
sha256sums=('1ec6826f93e462de038738d594068eed82234d5b3ddbc623678e63a0edf6d98a')

package() {
	install -Dm755 filecrab "$pkgdir/usr/bin/filecrab"
}

