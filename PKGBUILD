# Contributor: William Hahn <bill@hahn3.com>

pkgname=wrapaur
pkgver=2.0.0
pkgrel=3
pkgdesc="A simple pacman and AUR wrapper written in bash to help with everyday package tasks"
arch=('i686' 'x86_64')
url="https://aur.archlinux.org/wrapaur.git"
license=('GPL')
depends=('bash' 'coreutils' 'curl' 'grep' 'gawk' 'sed' 'git' 'pacman' 'sudo')
optdepends=('s-nail: required for mail notifications')
source=("wrapaur")
md5sums=('1949f53da96c5a515fd3883cdda13ef7')

package() {
  install -Dm755 wrapaur "$pkgdir/usr/bin/wrapaur"
}
