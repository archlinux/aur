# Maintainer GI_Jack <GI_Jack@hackermail.com>
# MContributor: Sirat18 <aur@sirat18.de>
# Contributor: Frédérik Paradis <fredy14[at]gmail[dot]com>

pkgname=inception
pkgver=0.4.2
pkgrel=2
pkgdesc="A FireWire physical memory manipulation and hacking tool exploiting IEEE 1394 SBP-2 DMA."
url="https://github.com/carmaa/inception/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('python' 'python-libforensic1394')
optdepends=()
makedepends=('cmake' 'gcc')
conflicts=('inception-git')
provides=('inception')
source=("https://github.com/carmaa/inception/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('cdacc572c7c75a1a96d66c2268691821edf3c82d0c04ce2a724511af7ed42de2debb6553a5108f45c6b0fb1836e0848370aa11fd304791da14c5419a218e586c')

package() {
  cd "${srcdir}/${pkgname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

