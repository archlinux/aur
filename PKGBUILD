# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
pkgname=bootiso
pkgver=3.2.0
pkgrel=1
pkgdesc="A bash script to securely create a bootable USB device from one ISO file."
arch=('any')
url="https://github.com/jsamr/bootiso"
license=('MIT')
depends=('syslinux' 'mtools' 'rsync' 'bc' 'wimlib')
source=("https://github.com/jsamr/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3deb5adda023944e93c7f93f48d5d015c0b212b4ec4c1fbc1f1a1dc6663bb7a2')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 bootiso "$pkgdir/usr/bin/bootiso"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
