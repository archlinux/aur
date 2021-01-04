# Maintainer: Anthony Wang <ta180m@gmail.com>
pkgname=2048-py
pkgver=0.1.6
pkgrel=1
pkgdesc="2048 written in Python by the Ladue High School Computer Science Club"
arch=('any')
url="https://github.com/Ta180m/2048"
license=('GPL')
depends=('python' 'python-termcolor')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Ta180m/2048/archive/v$pkgver.tar.gz")
sha256sums=('953f062b62871e3ce4e2b6de8dab02739bcea6596922c68d8bb48d416354bc35')


package() {
   cd "${srcdir}/2048-$pkgver"
   make DESTDIR="${pkgdir}" PREFIX=/usr install
}
