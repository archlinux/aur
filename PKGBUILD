# Maintainer: Gour <gour@atmarama.net>
# Contributor: Atomisirsi <atomisirsi@gsklan.de>
pkgname=bzr-git-plugin
_pkgname=bzr-git
pkgver=0.6.8
pkgrel=4
pkgdesc="Plugin for bzr to work with git trees"
url="http://wiki.bazaar.canonical.com/ForeignBranches/Git"
arch=('i686' 'x86_64')
license=('GPL2')
conflicts=('bzr-git')
replaces=('bzr-git')
depends=('python2-dulwich' 'bzr')
source=(http://launchpad.net/$_pkgname/trunk/$pkgver/+download/$_pkgname-$pkgver.tar.gz)
md5sums=('8f9f64787703750f38daf7c15162f75a')

package() {
  cd ${srcdir}/$_pkgname-$pkgver
  python2 setup.py install --prefix=/usr --root=${pkgdir} || return 1
}
