# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
pkgname=bootiso
pkgver=3.2.2
pkgrel=1
pkgdesc="A bash script to securely create a bootable USB device from one ISO file."
arch=('any')
url="https://github.com/jsamr/bootiso"
license=('MIT')
depends=('syslinux' 'mtools' 'rsync' 'bc' 'wimlib')
source=("https://github.com/jsamr/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('50d3d4ce855db8b3328e4f7bbe677de2531a341276cc2b546e5fefc9f593a9f9')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 bootiso "$pkgdir/usr/bin/bootiso"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
