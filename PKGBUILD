# Maintainer: Dylan Baker <dylan@pnwbakers.com>
pkgname=python2-gpg
pkgver=1.8.0
pkgrel=2
pkgdesc="Python bindings for gpgme"
arch=('any')
url="https://pypi.python.org/pypi/gpg"
license=('LGPL2.1+' 'GPL2+')
depends=('libgpg-error' 'gnupg' 'swig' 'python2')
optdepends=()
makedepends=('python2-setuptools')
options=(!emptydirs)
source=('https://pypi.python.org/packages/9f/46/4f6b63d1b5b82bac52b5b7723df8cd66a4864dc29861aa14d2d2de4a57f5/gpg-1.8.0.tar.gz'
        'https://pypi.python.org/packages/9f/46/4f6b63d1b5b82bac52b5b7723df8cd66a4864dc29861aa14d2d2de4a57f5/gpg-1.8.0.tar.gz.asc')
sha256sums=('cd26e8a77c907e0d9f14a627bf71729456fd26aa2d1f4d275b808d70b089e4f4'
            'SKIP')
validpgpkeys=('99B03CE455DB476E737057B44FD0FA5528DB9E3F')  # Justus Winter

package() {
  cd "$srcdir/gpg-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
