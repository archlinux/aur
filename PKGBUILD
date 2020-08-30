# Maintainter: Everett B. everettbutts@hotmail.com 
pkgname=arch-matrix-grub-theme-git
_gitname="arch-matrix"
pkgver=V1.0.3
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
sha512sums=('SKIP')
conflicts=( "arch-matrix-grub-theme-git")
provides=("arch-matrix-grub-theme-git=$pkgver")

pkgver() {
  cd "$pkgname"
  git describe --tag
}

package() {
    install -dm 755 $pkgdir/boot/grub/themes/arch-matrix
    cp -r --no-preserve=ownership arch-matrix-grub-theme-git/arch-matrix $pkgdir/boot/grub/themes/
}
