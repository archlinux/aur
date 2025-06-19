# Maintainer: enessmr <enessmr22@gmail.com>
pkgname=hmy-agsv1-fork-enessmr-git
pkgver=1.0
pkgrel=1
pkgdesc="That dotfiles"
arch=('x86_64')
url="https://github.com/enessmr/hyprland-material-you"
license=('GPL3')
makedepends=('git' 'base-devel')
source=("git+https://github.com/enessmr/hyprland-material-you.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/hmy-agsv1-fork-enessmr-git"
  cd ..
  mv hmy-agsv1-fork-enessmr-git ~/dotfiles
  cd "~/dotfiles"
  cat pkgver.txt
}

package() {
  cd "~/dotfiles"
  ./install.sh
}
