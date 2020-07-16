# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-subprocess32
pkgver=3.5.4
pkgrel=1
pkgdesc='A backport of the subprocess module from Python 3 for use on 2.x.'
arch=('any')
url="https://github.com/google/python-subprocess32"
license=('PSF')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/32/c8/564be4d12629b912ea431f1a50eb8b3b9d00f1a0b1ceff17f266be190007/subprocess32-${pkgver}.tar.gz")
sha256sums=('eb2937c80497978d181efa1b839ec2d9622cf9600a039a79d0e108d1f9aec79d')

package() {
  cd "subprocess32-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}