# Maintainer: robertfoster

pkgname=python-phonemes2ids
pkgver=1.2.0
pkgrel=1
pkgdesc="Flexible tool for assigning integer ids to phonemes"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/rhasspy/phonemes2ids"
license=('MIT')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v$pkgver.tar.gz")

package() {
  cd ${pkgname##python-}-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1
}

sha256sums=('4af10276c90a0713c0886c18fe4cbf3f8c66c9750b97ce1a818cfc742f69fad2')
