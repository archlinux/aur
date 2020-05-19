# Maintainer: Avahe Kellenberger <avahe@protonmail.ch>
pkgname='nimdow-bin'
pkgver='0.3'
pkgrel='0'
pkgdesc="Tiling Window Manager written in Nim"
arch=('x86_64')
url="https://github.com/avahe-kellenberger/nimdow"
license=('GPL2')
source=("$url/releases/download/v$pkgver/nimdow")
md5sums=('8e8f400a03d4e89404c6b1e7cce3d5c7')

package() {
  sudo install -Dt "/usr/bin" "nimdow"
}

