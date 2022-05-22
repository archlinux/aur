pkgname='nfetch-bin'
pkgdesc="A minimal linux fetch utility written in nim"
pkgver=1.00
pkgrel=1
arch=('x86_64')
url="https://github.com/Infinitybeond1/nfetch-src"
license=('GPL3')
source=("nfetch-src-$pkgver::https://github.com/Infinitybeond1/nfetch-src/archive/refs/tags/nfetch.tar.gz")
makedepends=('nim' 'nimble')
conflicts=('nfetch-bin')
sha256sums=('6bf668a334f0053a907e0c7c594bc68fa5e0ab06d40147367e235e05fc32010d')

package() {
  wget "https://github.com/Infinitybeond1/nfetch-src/archive/refs/tags/nfetch.tar.gz"
  tar xvf nfetch.tar.gz
  cd nfetch-src-nfetch
  nimble build
  sudo install nfetch /usr/bin
}
