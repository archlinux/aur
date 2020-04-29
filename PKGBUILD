# Maintainer: itsme <mymail@ishere.ru>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgname=python-dnsimple
pkgdesc="Python client for DNSimple domain registration and DNS hosting"
pkgver=1.2.0
pkgrel=1
arch=('any')
url="https://github.com/onlyhavecans/dnsimple-python"
license=('MIT')
makedepends=('python-pip' 'git')
depends=('python' 'python-requests')
source=("git+https://github.com/onlyhavecans/dnsimple-python#tag=${pkgver}")
sha256sums=('SKIP')

package() {
  cd $srcdir/dnsimple-python

  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
