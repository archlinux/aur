# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=python-pysmb
pkgver=1.1.25
pkgrel=1
pkgdesc="An experimental SMB/CIFS library written in Python"
arch=(any)
url="https://miketeo.net/wp/index.php/projects/pysmb"
license=('ZLIB')
depends=('python' 'python-setuptools' 'python-pyasn1')
source=("https://miketeo.net/files/Projects/pysmb/pysmb-${pkgver}.zip")
sha1sums=('ddc0d70ae2879e488413d38b9726b334f8540691')

package() {
  cd pysmb-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
