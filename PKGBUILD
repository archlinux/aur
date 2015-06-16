# Maintainer: Giulio Fidente <gfidente at gmail dot com>

pkgname=python-pygithub
pkgver=1.25.2
pkgrel=1
pkgdesc="Python library implementing the full GitHub API v3"
arch=('any')
url="http://github.com/jacquev6/PyGithub"
replaces=('python-github')
license=('LGPL')
depends=('python')
makedepends=('python-setuptools')
source=(https://github.com/jacquev6/PyGithub/archive/v$pkgver.tar.gz)
md5sums=('edf77b46036f58b2c857c62444b93166')

package() {
  cd $srcdir/PyGithub-$pkgver
  python setup.py install --prefix=/usr --root=$pkgdir
}
