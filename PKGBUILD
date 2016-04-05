pkgname=python-dkim
pkgver=0.5.6
pkgrel=1
pkgdesc="Python module that implements DKIM email signing and verification"
arch=('any')
url="https://launchpad.net/dkimpy"
license=('MIT')
depends=('python' 'python-dnspython')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://launchpad.net/dkimpy/trunk/0.5.6/+download/dkimpy-${pkgver}.tar.gz")
sha512sums=('208a60142f2c9db4323b82f1759efdcd0f837a14ecde4eee8a5924d03fad581596ab63825db270e9c6017891315af65c5d1247952ac8fa918391f9364b31d39c')

package() {
  cd "$srcdir/dkimpy-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
