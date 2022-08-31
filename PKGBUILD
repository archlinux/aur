# Maintainer: NAHO <90870942+trueNAHO@users.noreply.github.com>

pkgname=grub-theme-vimix-very-dark-blue
pkgver=r43.ca95c76
pkgrel=1
epoch=
pkgdesc="Simple very dark blue GRUB theme"
arch=(any)
url="https://github.com/trueNAHO/grub2-theme-vimix-very-dark-blue"
license=(GPL3)
groups=()
depends=(grub)
makedepends=(git)
checkdepends=()
optdepends=('grub-customizer: GUI tool to configure GRUB')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -dm 755 "$pkgdir/usr/share/grub/themes/$pkgname"
  cp -r --no-preserve=ownership grub2-theme-vimix-very-dark-blue/src/. \
      "$pkgdir/usr/share/grub/themes/$pkgname"
}
