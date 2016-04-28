# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_pkgname=python-jenkins
pkgname=python-$_pkgname
pkgver=0.4.12
pkgrel=1
pkgdesc="A python wrapper for the Jenkins REST API which aims to provide a more conventionally pythonic way of controlling a Jenkins server."
url="http://git.openstack.org/cgit/openstack/python-jenkins"
license=("BSD")
arch=("i686" "x86_64")
makedepends=("python-setuptools")
depends=("python" "python-six" "python-multi_key_dict")
source=("https://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=("7d57db182ff9e12f2280e1672e40e46d")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
