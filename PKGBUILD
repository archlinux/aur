# Contributor: William Hahn <bill@hahn3.com>

pkgname=wrapaur
pkgver=2.0.2
pkgrel=1
pkgdesc="A simple pacman and AUR wrapper written in bash to help with everyday package tasks"
arch=('i686' 'x86_64')
url="https://aur4.archlinux.org/packages/wrapaur/"
license=('GPL')
depends=('bash' 'coreutils' 'curl' 'grep' 'gawk' 'sed' 'git' 'pacman' 'sudo')
optdepends=('s-nail: required for mail notifications')
source=("wrapaur")
md5sums=('f88057d058e4e9f38ff43e8dec604800')

package() {
  install -Dm755 wrapaur "$pkgdir/usr/bin/wrapaur"
}
