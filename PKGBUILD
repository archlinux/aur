# $Id$
# Maintainer: eshizhan <eshizhan@126.com>
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Schnouki <thomas.jost@gmail.com>
# Contributor: devon <admin@patched.biz>

pkgname=dstat-py3
pkgver=0.7.3py3
pkgrel=1
pkgdesc="A versatile resource statistics tool, Python 3 porting"
arch=('any')
url="https://github.com/eshizhan/dstat/"
license=('GPL')
depends=('python')
provides=('dstat')
source=(https://github.com/eshizhan/dstat/archive/${pkgver}.tar.gz)
md5sums=('cec63b7b9247c0c9586258851d9a1f11')

package() {
  cd ${pkgname%%-*}-$pkgver

  make DESTDIR=$pkgdir install
  make DESTDIR=$pkgdir docs
}
