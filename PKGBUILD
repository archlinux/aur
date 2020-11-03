# Maintainer: Anthony Wang <ta180m@gmail.com>
pkgname=2048-py
pkgver=0.1.1
pkgrel=1
pkgdesc="2048 written in Python by the Ladue High School Computer Science Club"
arch=('any')
url="https://github.com/Ta180m/2048"
license=('GPL')
depends=('python-termcolor')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Ta180m/2048/releases/download/v$pkgver/2048.tar.gz")
sha256sums=('db80458ede4d15d0cc06a84311ea56a9dff1b99a0b88373b561b51f6a7119f6b')


package() {
   cd "${srcdir}/2048"
   make DESTDIR="${pkgdir}" PREFIX=/usr install
}
