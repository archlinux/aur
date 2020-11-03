# Maintainer: Anthony Wang <ta180m@gmail.com>
pkgname=2048-py
pkgver=0.1.3
pkgrel=1
pkgdesc="2048 written in Python by the Ladue High School Computer Science Club"
arch=('any')
url="https://github.com/Ta180m/2048"
license=('GPL')
depends=('python' 'python-termcolor')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Ta180m/2048/releases/download/v$pkgver/2048.tar.gz")
sha256sums=('fb7a2c6750c65ad73fa9ad813331801fe4acba85728608bdabe3cc1d617649bf')


package() {
   cd "${srcdir}/2048"
   make DESTDIR="${pkgdir}" PREFIX=/usr install
}
