# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=python-pysmb
pkgver=1.2.5
pkgrel=1
pkgdesc="An experimental SMB/CIFS library written in Python"
arch=(any)
url="https://miketeo.net/wp/index.php/projects/pysmb"
license=('ZLIB')
depends=('python' 'python-setuptools' 'python-pyasn1')
source=("https://miketeo.net/files/Projects/pysmb/pysmb-${pkgver}.zip")
sha1sums=('935aeea64ed0aa69ee1b348837bc4f16e48e9808')

package() {
  cd pysmb-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
