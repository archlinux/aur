# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_pkgname=jenkins-job-builder
pkgname=python-$_pkgname
pkgver=1.4.0
pkgrel=1
pkgdesc="Jenkins Job Builder takes simple descriptions of Jenkins jobs in YAML or JSON format and uses them to configure Jenkins."
url="http://docs.openstack.org/infra/system-config/jjb.html"
license=("Apache")
arch=("i686" "x86_64")
makedepends=("python-setuptools")
depends=("python" "python-yaml" "python-pbr" "python-six" "python-python-jenkins")
source=("https://pypi.python.org/packages/source/j/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=("4f9610412c17888d60af5e6db90c388d")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
