# Maintainer: Nicolas Gouttefangeas <ngou0210@gmail.com>
pkgname=filecrab-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="A CLI to share files and text with Filecrab"
arch=('x86_64')
url="https://github.com/NicolasGB/filecrab"
license=('MIT')
depends=('gcc-libs' 'openssl')
provides=('filecrab')
conflicts=('filecrab')
source=("https://github.com/NicolasGB/filecrab/releases/download/v${pkgver}/filecrab-v${pkgver}.tgz")
sha256sums=('58edb4e75f4a80d12cf06e2c100ae2412b445f9f91dcb894b572caa801673335')

package() {
	install -Dm755 filecrab "$pkgdir/usr/bin/filecrab"
}

