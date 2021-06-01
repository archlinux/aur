pkgname=('adscript')
pkgdesc="A high-performance, s-expressions based programming language that is natively compiled."
pkgver=1.0
pkgrel=1
url="https://github.com/Amplus2/Adscript"
license=('MPL2')
options=(!buildflags)
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
depends=('llvm>=11.1')
makedepends=('clang>=11.1')
source=("https://github.com/Amplus2/Adscript/archive/refs/tags/${pkgver}.zip")
md5sums=('8259f668075a6765335c112f6ba0b2e0')


build() {
  cd "Adscript-$pkgver"
  bash -c "make"
}

package() {
  cd "Adscript-$pkgver"
  sudo make install PREFIX=/usr
}



