# Maintainer: Nicolas Gouttefangeas <ngou0210@gmail.com>
pkgname=filecrab-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A CLI to share files and text with Filecrab"
arch=('x86_64')
url="https://github.com/NicolasGB/filecrab"
license=('MIT')
depends=('gcc-libs' 'openssl')
provides=('filecrab')
conflicts=('filecrab')
source=("https://github.com/NicolasGB/filecrab/releases/download/v${pkgver//_/-}/filecrab")
sha256sums=('56006a17b991f5cd0f94a046b1086291fb4a54e9fc601b9c3dc4dc25f3da49a7')

package() {
	install -Dm755 filecrab "$pkgdir/usr/bin/filecrab"
}

