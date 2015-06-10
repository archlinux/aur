# Maintainer : Achilleas Pipinellis <axilleas archlinux info>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
pkgname=python2-zope.proxy
_pkgname=zope.proxy
pkgver=4.1.4
pkgrel=1
pkgdesc="Generic Transpatent Proxies"
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/zope.proxy/"
license=('ZPL')
depends=('python2')
makedepends=('python2-distribute' 'zope-interface')
optdepends=('zope-testing: For testing')
source=(http://pypi.python.org/packages/source/z/${_pkgname}/${_pkgname}-$pkgver.tar.gz)

package() {
  cd $srcdir/${_pkgname}-$pkgver
  python2 setup.py install --root=$srcdir/pkg --prefix=/usr
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('3bcaf8b8512a99649ecf2f158c11d05b')
