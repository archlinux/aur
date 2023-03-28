# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=pacman-hook-reproducible-status
pkgver=2
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
sha256sums=('eab9bfc6ea45d1e37582898896696d853b84a332cdbcd66775bd42a8df00641f'
    'ca06e6537efca28a552972faf5eac45f087ef5b1825e2c2d0c9f741d4387f55a'
    '76b0ef1a2d998cc2ae2869bf2b43a1ac5fe5195c25998b35a0352644b4d44d8b')

package() {
    make -C "${srcdir}" DESTDIR="${pkgdir}" install
}
