# Contributor: William Hahn <bill@hahn3.com>

pkgname=wrapaur
pkgver=2.0.1
pkgrel=1
pkgdesc="A simple pacman and AUR wrapper written in bash to help with everyday package tasks"
arch=('i686' 'x86_64')
url="https://aur4.archlinux.org/packages/wrapaur/"
license=('GPL')
depends=('bash' 'coreutils' 'curl' 'grep' 'gawk' 'sed' 'git' 'pacman' 'sudo')
optdepends=('s-nail: required for mail notifications')
source=("wrapaur")
md5sums=('d55452f0e54044025b9dac35424245b2')

package() {
  install -Dm755 wrapaur "$pkgdir/usr/bin/wrapaur"
}
