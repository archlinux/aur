# Maintainer: Simon Jackson <sizeak at gmail dot com>

pkgname=orchard-bin
pkgdesc="Orchestrator for running Tart Virtual Machines on a cluster of Apple Silicon devices."
pkgver=0.22.1
pkgrel=1
arch=('x86_64')
url="https://github.com/cirruslabs/orchard"
license=('LicenseRef-fair-source-0.9')
provides=("orchard")
source=("$pkgname-$pkgver-amd64.tar.gz::$url/releases/download/$pkgver/orchard-linux-amd64.tar.gz")
sha256sums=('2648d1f40351643691daeb169811deb45d8a646afee106cff127729bbe625e36')

package() {
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 orchard "$pkgdir/usr/bin/orchard"
}
