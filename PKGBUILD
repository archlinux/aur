# Maintainer: Nicolas Gouttefangeas <ngou0210@gmail.com>
pkgname=filecrab-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A CLI to share files and text with Filecrab"
arch=('x86_64')
url="https://github.com/NicolasGB/filecrab"
license=('MIT')
depends=('gcc-libs' 'openssl')
provides=('filecrab')
conflicts=('filecrab')
source=("https://github.com/NicolasGB/filecrab/releases/download/v${pkgver//_/-}/filecrab")
sha256sums=('d357c84a4cff77313c3b646be5abdca4f067828f18e08255db9978bef97fdbdf')

package() {
	install -Dm755 filecrab "$pkgdir/usr/bin/filecrab"
}

