# Maintainer: Tomás Duarte <alfarrofo@gmail.com>
_pkgname=pacman-zfs-hook
pkgname=${_pkgname}
pkgver=1.0.1
pkgrel=2
epoch=
pkgdesc="Pacman Hook to create ZFS Snapshots on Pacman transactions."
arch=('x86_64')
url="https://github.com/MustachedSquid/Pacman-ZFS-Hook"
license=('BSD')
depends=('bash' 'pacman')
makedepends=()
checkdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("$pkgname-$pkgver.tar.gz::https://github.com/MustachedSquid/Pacman-ZFS-Hook/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("4904be067b5db9576b1516519305a2511312b3c9fd9d9895a985211682ecb2ff")

package() {
	cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
