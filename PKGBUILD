# Maintainer: Akshay Nair <phenax5@gmail.com>
pkgname=bsp-layout-git
pkgver=0.0.11
pkgrel=1
pkgdesc="Dynamic layout management for bspwm with tall, wide, even, tiled, monocle (Git master)"
arch=('any')
url="https://github.com/phenax/bsp-layout"
license=('MIT')
depends=('bash' 'bc')
makedepends=('bash' 'git' 'curl')
checkdepends=()
optdepends=()
provides=("bsp-layout")
conflicts=("bsp-layout")
replaces=("bsp-layout")
install=".install"

package() {
  curl https://raw.githubusercontent.com/phenax/bsp-layout/master/install.sh | sudo sh -;
}

