# Contributor: William Hahn <bill@hahn3.com>

pkgname=wrapaur
pkgver=2.0.9
pkgrel=3
pkgdesc="A simple pacman and AUR wrapper written in bash to help with everyday package tasks"
arch=('i686' 'x86_64')
url="https://aur.archlinux.org/packages/wrapaur/"
license=('GPL')
depends=('bash' 'coreutils' 'curl' 'grep' 'gawk' 'sed' 'git' 'pacman' 'sudo')
optdepends=('s-nail: required for mail notifications')
source=("wrapaur")
md5sums=('c78df0bfef4836aa354b07c480fbbc60')

package() {
  install -Dm755 wrapaur "$pkgdir/usr/bin/wrapaur"
}
