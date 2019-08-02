# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Serede Sixty Six <serede.dev@gmail.com>

pkgname='nemo-audio-tab'
pkgver=4.2.0
pkgrel=1
pkgdesc="View audio tag information in Nemo's properties tab"
arch=('any')
license=('GPL2')
url="https://github.com/linuxmint/nemo-extensions"
depends=('nemo-python>=3.9.0' 'python-mutagen')
makedepends=('python-distutils-extra')
options=('!emptydirs')
source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('8ee8698c6058762965635d8233c18a4019437f73752e2085087d812aa46c0fe5')

package() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"
  python ./setup.py install --prefix=/usr --root="${pkgdir}" \
                            --no-compile -O0
}
