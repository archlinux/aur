pkgname=arch-matrix-grub-theme-git
_gitname="arch-matrix"
pkgver=r2.130001
pkgrel=1
pkgdesc="Arch Matrix Grub theme."
arch=('any')
license=('GPL3')
depends=('grub')
optdepends=()
install=""
url="https://github.com/Can221-ParOS/arch-matrix-grub-theme-git.git"
source=("git+$url")
makedepends=('git')
sha512sums=('13FCBDF64ADA57575772ABE574650E6680ADEA8D99767629F60E43FDB51BB4EA3FBBE03C293523AE50A79950FF115497CC0E72F5AD357323C49BF009B6C8B1B8')
conflicts=( "arch-matrix-grub-theme-git")
provides=("arch-matrix-grub-theme-git=$pkgver")

package() {
    install -dm 755 $pkgdir/boot/grub/themes/arch-matrix
    cp -r --no-preserve=ownership arch-matrix-grub-theme-git/arch-matrix $pkgdir/boot/grub/themes/
}
