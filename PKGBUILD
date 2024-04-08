# Maintainer: Tomás Duarte <alfarrofo@gmail.com>
_pkgname=pacman-zfs-hook
pkgname=${_pkgname}
pkgver=1.0.2
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
sha256sums=("9a94444844584de6cdf7a1d4ad2be86a9dd38906878f46cd69421876a91118cc")

package() {
	cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
