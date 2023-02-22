pkgname=qnetwalk
pkgver=1.9.0
pkgrel=1
pkgdesc="Connect all the terminals to the server, in as few turns as possible"
arch=('x86_64')
url="https://github.com/AMDmi3/qnetwalk"
license=('GPL')
depends=('qt6-multimedia')
makedepends=('cmake' 'qt6-tools')
source=("https://github.com/AMDmi3/qnetwalk/archive/$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_SKIP_INSTALL_RPATH=YES .
  cmake --build .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir/" cmake --install .
}

md5sums=('f50cfda130b1e1ee965e69b5c343974e')
sha1sums=('cf8547a0efe9d4ed7657b971e221980032c7c43a')
sha256sums=('d5c1a9fb088c60d6dc622d52c302b5ad69e89a4ec63adbd058c2c942191b753e')
sha384sums=('b3e428788fbc6383868ea5262ca501e82c6cec6343a9852426f3b38cca08d4fb40fb38518a69988bbacfa116b1be30a9')
sha512sums=('544ce8c4828a16c9b25f76b8e8f1da9e6fb61358c49215583daed958d160e1c8dd18aec258364348cc506017a446f7838f482247ae8240a3441e28e43402368b')
