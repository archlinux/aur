# Maintainer: Bash booster <booster.sdk@gmail.com>

pkgname=('python2-kerberos')
pkgver=1.2.5
pkgrel=1
pkgdesc="A high-level wrapper for Kerberos (GSSAPI) operations"
url="https://pypi.python.org/pypi/kerberos"
arch=('any')
license=('Apache License, Version 2.0')
depends=('krb5')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=(https://pypi.io/packages/source/k/kerberos/kerberos-${pkgver}.tar.gz)
md5sums=('0df306b6bc0806bc480d4c282229d6ba')

package_python2-kerberos() {
  depends=('python2' 'python2-setuptools')

  cd "$srcdir/kerberos-$pkgver"
  python2 setup.py build
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}
