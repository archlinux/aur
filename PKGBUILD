pkgname='adscript'
pkgdesc="A high-performance, s-expressions based programming language that is natively compiled."
pkgver=0.4
pkgrel=1
url="https://github.com/Amplus2/Adscript"
license=('MPL2')
options=(!buildflags)
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
depends=('llvm>=11.1')
makedepends=('clang>=11.1')
source=("${url}/archive/refs/tags/${pkgname}-${pkgver}.zip")
md5sums=('SKIP')
install=$pkgname.install

upname='Adscript'

build() {
  cd "$upname-$pkgname-$pkgver"
  make
}

package() {
  cd "$upname-$pkgname-$pkgver"
  sudo make install PREFIX=/usr
}



