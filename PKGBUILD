# Maintainer: Anthony Wang <ta180m@proton.me>
pkgname=2048-py
pkgver=0.1.6
pkgrel=2
pkgdesc="2048 written in Python by the Ladue High School Computer Science Club"
arch=('any')
url="https://codeberg.org/LadueCS/2048"
license=('GPL')
depends=('python' 'python-termcolor')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('de3b6ff0635e157f820d2a566867e166a2b3726e3a53476ef25980187e723870')


package() {
   cd "${srcdir}/2048"
   make DESTDIR="${pkgdir}" PREFIX=/usr install
}
