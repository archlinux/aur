# Maintainer: Nicolas Gouttefangeas <ngou0210@gmail.com>
pkgname=filecrab-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A CLI to share files and text with Filecrab"
arch=('x86_64')
url="https://github.com/NicolasGB/filecrab"
license=('MIT')
depends=('gcc-libs' 'openssl')
provides=('filecrab')
conflicts=('filecrab')
source=("https://github.com/NicolasGB/filecrab/releases/download/v${pkgver//_/-}/filecrab")
sha256sums=('b4a5462f456f37249fb6ecf21e05ece05656d7db05cbda1fee5d7f25a5ea5261')

package() {
	install -Dm755 filecrab "$pkgdir/usr/bin/filecrab"
}

