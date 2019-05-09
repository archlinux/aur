# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=python-pysmb
pkgver=1.1.27
pkgrel=1
pkgdesc="An experimental SMB/CIFS library written in Python"
arch=(any)
url="https://miketeo.net/wp/index.php/projects/pysmb"
license=('ZLIB')
depends=('python' 'python-setuptools' 'python-pyasn1')
source=("https://miketeo.net/files/Projects/pysmb/pysmb-${pkgver}.zip")
sha1sums=('88d1f13cb3cc71c1d6ebdad6f9730a8601a043d0')

package() {
  cd pysmb-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
