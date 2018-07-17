#Contributor: Olivier Le Moal <mail at olivierlemoal dot fr>
#Maintainer: Dawid Wrobel <cromo@klej.net>
#Maintainer: Sébastien Duquette <ekse.0x@gmail.com>
#Maintainer: onny <onny@project-insanity.org>

pkgname=wfuzz
pkgver=2.2.11
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
md5sums=('91281ea3cd32b0b9c8478d5cca424d05')
sha256sums=('d90ed28f5e301e1b8f66e041dedecc92c6e6c264da6fc2790ac69d11bce8e009')


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
