# Maintainer: Jonathan Arnold <jdarnold@archlinux.us>
# Contributor: Zhang Hai <dreaming.in.code.zh@gmail.com>

pkgname=python-mechanicalsoup
pkgver=0.3.1
pkgrel=3
pkgdesc="A Python library for automating interaction with websites"
arch=('any')
url="https://github.com/hickford/MechanicalSoup"
license=('MIT')
depends=('python-beautifulsoup4' 'python-requests' 'python-six')
makedepends=('python-setuptools')
source=("https://github.com/hickford/MechanicalSoup/archive/v${pkgver}.tar.gz")
md5sums=('fe5855a6a8b8e07691e29e25e4f0ef0d')

package() {
  cd "${srcdir}/MechanicalSoup-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
