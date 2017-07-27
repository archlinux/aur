# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=python-aioimaplib
pkgver=0.7.10
pkgrel=1
pkgdesc='Python asyncio IMAP4rev1 client library'
arch=('any')
url='https://github.com/bamthomas/aioimaplib'
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/bamthomas/${pkgname#python-}/archive/${pkgver}.tar.gz")
sha256sums=('4763a12b1edf77953502f17bce88acafa0560f8af0742426e2bc4836fa6ce7f4')

package() {
  cd "${pkgname#python-}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
