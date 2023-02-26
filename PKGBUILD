# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=pacman-hook-reproducible-status
pkgver=1
pkgrel=1
pkgdesc="Check reproducible status of packages after installation"
url="https://github.com/swsnr/pacman-hook-reproducible-status"
arch=('any')
license=('MPL2')
depends=('python')
source=(
    "99-check-reproducible-status.hook"
    "check-reproducible-status"
    "Makefile"
)
sha256sums=(
    "eab9bfc6ea45d1e37582898896696d853b84a332cdbcd66775bd42a8df00641f"
    "c021dee1112c1b95d996fd98e60573075f3ddb910d40bb41f62bb8f5983a8017"
    "a9a2e1a90fef27cdd21b55e0435c98067af5e116d83c2286280b96710fabf387"
)

package() {
    make -C "${srcdir}" DESTDIR="${pkgdir}" install
}
