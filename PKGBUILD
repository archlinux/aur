# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=python-aioimaplib
pkgver=0.7.12
pkgrel=1
pkgdesc='Python asyncio IMAP4rev1 client library'
arch=('any')
url='https://github.com/bamthomas/aioimaplib'
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/bamthomas/${pkgname#python-}/archive/${pkgver}.tar.gz")
sha256sums=('e94ca5cded540ddeedaa2344183a42fad04552c8b408ec5813bb27ecd8d5d037')

package() {
  cd "${pkgname#python-}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
