# Maintainer: Platon Pronko <platon7pronko@gmail.com>

pkgname='python-javalang'
pkgver=0.13.0
pkgrel=1
pkgdesc="Pure Python Java parser and tools"
arch=('any')
url='https://github.com/c2nes/javalang'
license=('MIT')
makedepends=('python-setuptools')

source=("https://github.com/c2nes/javalang/archive/v${pkgver}.tar.gz")
sha256sums=('9abe66be2366c592fdf0648259a41ddb5c31ebda5c91422b9c8769ba91191551')

prepare() {
  cd "${srcdir}/javalang-${pkgver}"
}

package() {
  cd "${srcdir}/javalang-${pkgver}"
  python setup.py install --root=${pkgdir} 
}
