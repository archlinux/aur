# Maintainer: Nicolas Gouttefangeas <ngou0210@gmail.com>
pkgname=filecrab-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A CLI to share files and text with Filecrab"
arch=('x86_64')
url="https://github.com/NicolasGB/filecrab"
license=('MIT')
depends=('gcc-libs' 'openssl')
provides=('filecrab')
conflicts=('filecrab')
source=("https://github.com/NicolasGB/filecrab/releases/download/v${pkgver}/filecrab-v${pkgver}.tgz")
sha256sums=('7002a69ba902528402cd773cfe1a380efd5ff34483ae7e2f52b2778ae85703ba')

package() {
	install -Dm755 filecrab "$pkgdir/usr/bin/filecrab"
}

