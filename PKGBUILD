# Maintainer : Achilleas Pipinellis <axilleas archlinux info>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
pkgname=python-zope.proxy
_pyname=zope.proxy
pkgver=4.3.5
pkgrel=1
pkgdesc="Generic Transparent Proxies"
arch=('i686' 'x86_64')
url="https://pypi.org/project/zope.proxy/"
license=('ZPL')
depends=('python')
makedepends=('python-distribute' 'pypy-zope-interface')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")

package() {
  cd $srcdir/${_pyname}-$pkgver
  python setup.py install --root=$srcdir/pkg --prefix=/usr
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('2d102d9c22a81be04d9de7548c23b2a2')
