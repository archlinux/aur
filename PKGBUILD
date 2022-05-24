pkgname='nfetch-git'
pkgdesc="A minimal linux fetch utility written in nim"
pkgver=2.61
pkgrel=0
arch=('x86_64')
url="https://github.com/Infinitybeond1/nfetch-src"
license=('GPL3')
source=("git+https://github.com/Infinitybeond1/nfetch-src")
makedepends=('nim' 'nimble')
conflicts=('nfetch-bin')
sha256sums=('SKIP')

build() {
  cd nfetch-src
  nimble build
}

package() {
  cd nfetch-src
  sudo install nfetch "/usr/local/bin"
}
