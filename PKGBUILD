# Maintainer: Anthony Wang <ta180m@gmail.com>
pkgname=2048-py
pkgver=0.1.4
pkgrel=1
pkgdesc="2048 written in Python by the Ladue High School Computer Science Club"
arch=('any')
url="https://github.com/Ta180m/2048"
license=('GPL')
depends=('python' 'python-termcolor')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Ta180m/2048/releases/download/v$pkgver/2048.tar.gz")
sha256sums=('a724651b1134e101f7852b57efaa20930e3d74671e6efb0394ea485336dd2b64')


package() {
   cd "${srcdir}/2048"
   make DESTDIR="${pkgdir}" PREFIX=/usr install
}
