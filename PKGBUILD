# Maintainer: Giorgio Gilestro <giorgio at gilest.ro>

pkgname=ethoscope-virtuascope
pkgver=r1969.g0521648
pkgrel=3
pkgdesc="A platform for monitoring animal behaviour in real time from a raspberry pi - virtuascope addon"
arch=('any')
url="http://lab.gilest.ro/ethoscope"
license=('GPL3')
makedepends=('git') 
depends=('ethoscope-node' 'python-scipy' 'python-opencv' 'fmt' 'mariadb')
install="ethoscope-virtuascope.install"
source=("$pkgname::git+https://github.com/gilestrolab/ethoscope.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#package() {
  #nothing to do
#}


