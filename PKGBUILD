# Contributor: William Hahn <bill@hahn3.com>

pkgname=wrapaur
pkgver=2.0.4
pkgrel=1
pkgdesc="A simple pacman and AUR wrapper written in bash to help with everyday package tasks"
arch=('i686' 'x86_64')
url="https://aur4.archlinux.org/packages/wrapaur/"
license=('GPL')
depends=('bash' 'coreutils' 'curl' 'grep' 'gawk' 'sed' 'git' 'pacman' 'sudo')
optdepends=('s-nail: required for mail notifications')
source=("wrapaur")
md5sums=('2655a2e9a5ea2c2fb91ee7598a1abc32')

package() {
  install -Dm755 wrapaur "$pkgdir/usr/bin/wrapaur"
}
