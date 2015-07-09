# Contributor: William Hahn <bill@hahn3.com>

pkgname=wrapaur
pkgver=2.0.0
pkgrel=2
pkgdesc="A simple pacman and AUR wrapper written in bash to help with everyday package tasks"
arch=('i686' 'x86_64')
url="https://aur.archlinux.org/wrapaur.git"
license=('GPL')
depends=('bash' 'coreutils' 'curl' 'grep' 'gawk' 'sed' 'git' 'pacman' 'sudo')
optdepends=('s-nail: required for mail notifications')
source=("wrapaur")
md5sums=('81bd4d7d505a708ab6c3569f30adca4f')

package() {
  install -Dm755 wrapaur "$pkgdir/usr/bin/wrapaur"
}
