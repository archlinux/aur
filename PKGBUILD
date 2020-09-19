# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=reapack
pkgver=v1.2.3
pkgrel=1
pkgdesc="Package manager for the Reaper DAW"
arch=('x86_64')
url="https://reapack.com"
license=('GPL')
depends=('reaper-bin')
provides=()
source=("https://github.com/cfillion/reapack/releases/download/$pkgver/reaper_reapack-$arch.so")
md5sums=('81af4f8d488979495ba0264dd711de74')

package() {
	REAPACK="reaper_reapack-$arch.so"

	sudo install -Dm755 ./$REAPACK "/etc/$pkgname/$REAPACK"
}
