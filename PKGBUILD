# Maintainer: Toma <tom1103 [@ ]users.noreply.github.com>

pkgname=google-api-python-client
pkgver=1.4.1
pkgrel=1
_gitver=ffe845fc3de4a903f7368a8c089fac72f3ef9fb1
pkgdesc="This is the Python client library for Google's discovery based APIs."
license=("APACHE")
url="https://github.com/google/google-api-python-client"
depends=('python' 'python-uritemplate' 'python-httplib2')
makedepends=('python-setuptools')
optdepends=('python-pyopenssl' 'python-webtest' 'pycrypto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/google/google-api-python-client/archive/v${pkgver}.tar.gz")
#source=("${pkgname}-${pkgver}.tar.gz::https://github.com/google/google-api-python-client/archive/${_gitver}.tar.gz")
arch=('any')
options=(!emptydirs)

package() {
  cd $srcdir/$pkgname-$pkgver
  #cd $srcdir/$pkgname-$_gitver
  python setup.py install --root=$pkgdir
}

sha256sums=('7dfa74cf06834525efc5f77708250d10e41b893f774ae11d9bd8fe77eea8eca0')