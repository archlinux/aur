# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
pkgname=bootiso
pkgver=3.2.1
pkgrel=1
pkgdesc="A bash script to securely create a bootable USB device from one ISO file."
arch=('any')
url="https://github.com/jsamr/bootiso"
license=('MIT')
depends=('syslinux' 'mtools' 'rsync' 'bc' 'wimlib')
source=("https://github.com/jsamr/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('33aa3d6604c7a0429f8050e07f1b6b08d650ddbf3d16a814059128d99cda9913')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 bootiso "$pkgdir/usr/bin/bootiso"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
