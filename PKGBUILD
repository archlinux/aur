# Maintainer: Adam Goldsmith <adam@adamgoldsmith.name>

_name=rsa
pkgname=python2-$_name
pkgver=4.7
pkgrel=1
pkgdesc="Pure-Python RSA implementation"
arch=(any)
url="https://stuvel.eu/rsa"
license=('Apache')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('d56c9ec2d4b21a2e93c04fcabef45e40')

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
  rm $pkgdir/usr/bin/*
}

# vim:set ts=2 sw=2 et:
