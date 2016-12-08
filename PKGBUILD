# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=python-aioimaplib
pkgver=0.5.17
pkgrel=1
pkgdesc='Python asyncio IMAP4rev1 client library'
arch=('any')
url='https://github.com/bamthomas/aioimaplib'
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/bamthomas/${pkgname#python-}/archive/${pkgver}.tar.gz")
sha256sums=('0fdd9af56d6d89aab380835c410e32d674c4544dc21b506520b1675f36219d6c')

package() {
  cd "${pkgname#python-}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
