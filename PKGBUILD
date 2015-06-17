# Maintainer: Sirat18 <aur@sirat18.de>
# Contributor: Frédérik Paradis <fredy14[at]gmail[dot]com>

pkgname=inception
pkgver=0.4.1
pkgrel=1
pkgdesc="A FireWire physical memory manipulation and hacking tool exploiting IEEE 1394 SBP-2 DMA."
url="http://www.breaknenter.org/projects/inception/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('python' 'libforensic1394')
optdepends=()
makedepends=('cmake' 'gcc')
conflicts=('inception-git')
provides=('inception')
source=("https://github.com/carmaa/$pkgname/archive/v${pkgver}.tar.gz")
sha512sums=('b488d955527f8faa7d7e49d415c7f242a4b62dda63e6c00acfd13e6f00bb029815c6caa6a67d9d0d905f85858275994eef84443e5103b298398fc2ba52159795')

package() {
  cd "${srcdir}/${pkgname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
