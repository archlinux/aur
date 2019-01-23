#Contributor: Olivier Le Moal <mail at olivierlemoal dot fr>
#Maintainer: Dawid Wrobel <cromo@klej.net>
#Maintainer: Sébastien Duquette <ekse.0x@gmail.com>
#Maintainer: onny <onny@project-insanity.org>

pkgname=wfuzz
pkgver=2.3.4
pkgrel=1
pkgdesc="Utility to bruteforce web applications to find their not linked resources"
url="https://github.com/xmendez/wfuzz"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python2-pycurl' 'python2-pyparsing')
makedepends=()
conflicts=()
replaces=()
backup=()
source=("https://github.com/xmendez/wfuzz/archive/v$pkgver.tar.gz")
md5sums=('74817cc7aa14efda785c1727622e4539')
sha256sums=('87ff36d866cb173389f90cf026136758d3af73079a6199961de12ed86568be51')


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
