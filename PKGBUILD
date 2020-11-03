# Maintainer: Anthony Wang <ta180m@gmail.com>
pkgname=2048-py
pkgver=0.1.0
pkgrel=1
pkgdesc="2048 written in Python by the Ladue High School Computer Science Club"
arch=('any')
url="https://github.com/Ta180m/2048"
license=('GPL')
depends=('python-termcolor')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Ta180m/2048/releases/download/v$pkgver/2048.tar.gz")
sha256sums=('972ad8e8dc5a6f79da4ad0d0526d871c3654704b181f1a2a1a639d4d6d933f2a')


package() {
   cd "${srcdir}/2048"
   make DESTDIR="${pkgdir}" PREFIX=/usr install
}
