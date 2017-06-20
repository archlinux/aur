# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=python-aioimaplib
pkgver=0.7.2
pkgrel=1
pkgdesc='Python asyncio IMAP4rev1 client library'
arch=('any')
url='https://github.com/bamthomas/aioimaplib'
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/bamthomas/${pkgname#python-}/archive/${pkgver}.tar.gz")
sha256sums=('a213299c763f4d443d0d46dd00902f64eb22eba6f84004e17de7e0d244292945')

package() {
  cd "${pkgname#python-}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
