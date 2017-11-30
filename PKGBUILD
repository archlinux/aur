# Maintainer: Marco Laspe <marco@rockiger.com>

pkgname=akiee
pkgver=0.0.4
pkgrel=1
pkgdesc="A Markdown-based task manager for hackers and people who build stuff."
arch=("x86_64")
url="https://rockiger.com/en/akiee/"
license=("GPL")
depends=()
makedepends=()
sha256sums=('610a0d0c362e0281cb07c12d5d07515cb01d119b9a8a662cca6edfe74499396e')
source=("https://github.com/rockiger/akiee-release/raw/linux-release/dist/akiee-0.0.4.pacman")
noextract=('akiee-0.0.4.pacman')

package() {
    sudo pacman -U "akiee-0.0.4.pacman"
}
