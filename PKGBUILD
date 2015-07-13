# Contributor: William Hahn <bill@hahn3.com>

pkgname=wrapaur
pkgver=2.0.0
pkgrel=4
pkgdesc="A simple pacman and AUR wrapper written in bash to help with everyday package tasks"
arch=('i686' 'x86_64')
url="https://aur4.archlinux.org/packages/wrapaur/"
license=('GPL')
depends=('bash' 'coreutils' 'curl' 'grep' 'gawk' 'sed' 'git' 'pacman' 'sudo')
optdepends=('s-nail: required for mail notifications')
source=("wrapaur")
md5sums=('4cf29d571a5222d2be1152e42404130a')

package() {
  install -Dm755 wrapaur "$pkgdir/usr/bin/wrapaur"
}
