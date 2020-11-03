# Maintainer: Anthony Wang <ta180m@gmail.com>
pkgname=2048-py
pkgver=0.1.2
pkgrel=1
pkgdesc="2048 written in Python by the Ladue High School Computer Science Club"
arch=('any')
url="https://github.com/Ta180m/2048"
license=('GPL')
depends=('python-termcolor')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Ta180m/2048/releases/download/v$pkgver/2048.tar.gz")
sha256sums=('e69b860e2371939916edf7be6762ea04c38ae4e5b1e5c37c04deaf887ec83399')


package() {
   cd "${srcdir}/2048"
   make DESTDIR="${pkgdir}" PREFIX=/usr install
}
