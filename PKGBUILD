pkgname=qnetwalk
pkgver=1.7.0
pkgrel=1
pkgdesc="Connect all the terminals to the server, in as few turns as possible"
arch=('x86_64')
url="https://github.com/AMDmi3/qnetwalk"
license=('GPL')
depends=('qt5-base' 'sdl2_mixer')
makedepends=('cmake' 'qt5-tools')
source=("https://github.com/AMDmi3/qnetwalk/archive/$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
  cmake --build .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir/" cmake --install .
}

md5sums=('149a13de2832d8d55a5faf84ae54fc97')
sha1sums=('f2c6e35696755dbf3b640f54f5411286bc65162a')
sha256sums=('2922ee1654c376e381776810174b78978097fb4a80fc678e732245200191df54')
sha384sums=('f871ec455a3a4cd7bab2c733d01203984830e2fb2f2f32a30dc47e8a16e0e1d66175c85cc422e78b905881f79e72a536')
sha512sums=('64f83d478df6bf0e162c7de4417895c06f5ba545ba045ccbafb3668d8355fbc26f528ed0e6067fa89a553d57a161b5f7699eabe71c3a328e2c5fee9111d0aa3e')
