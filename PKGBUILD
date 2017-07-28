# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=python-aioimaplib
pkgver=0.7.11
pkgrel=1
pkgdesc='Python asyncio IMAP4rev1 client library'
arch=('any')
url='https://github.com/bamthomas/aioimaplib'
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/bamthomas/${pkgname#python-}/archive/${pkgver}.tar.gz")
sha256sums=('efad743ac6682ba526df86d1730f500f7edc3646f1d6e884bb83a2636c04c477')

package() {
  cd "${pkgname#python-}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
