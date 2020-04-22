# Maintainer: TheBitStick <the at bitstick dot rip>
pkgname=nautilus-gnome-disks
pkgver=0.1.1
pkgrel=2
pkgdesc="Allows you to restore/write/flash a disk image to storage devices using GNOME Disks from Nautilus"
arch=('any')
url="https://github.com/thebitstick/nautilus-gnome-disks"
license=('GPL3')
depends=('python-nautilus' 'gnome-disk-utility')
makedepends=('git')
provides=('nautilus-gnome-disks')
conflicts=('nautilus-gnome-disks')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('4471f4087f0a5be3701ec1aa66bae5ef68ddfa0f0f75d7c2e6de5b130721fe1f94be8f546f2afcfd60ad291da74f72a091761daea9cdb7b7b755d95f90d05b00')

package() {
	cd "$pkgname-$pkgver"

	install --mode=644 -D -t "$pkgdir/usr/share/nautilus-python/extensions" "nautilus-gnome-disks.py"
} 
