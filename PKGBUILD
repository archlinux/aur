# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Mark Huo <markhuomian at gmail dot com>

pkgname=git-repo
pkgver=1.10.2
pkgrel=1
pkgdesc="Tool for managing remote repositories from your git CLI!"
arch=('any')
url="https://github.com/guyzmo/git-repo"
license=('GPL2')
depends=('python' 'python-docopt' 'python-progress' 'python-dateutil'
         'python-lxml' 'python-gitpython' 'python-github3' 'python-gitlab>=0.18'
         'python-gogs-client' 'python-pybitbucket_fork-git')
makedepends=('python-setuptools' 'python-pip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('f6e4f8a1b12b6920d5b75dfc8cd3d70bd5c187f7ad95c12eba52d6fad63eb286')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="${pkgdir}" --optimize=1
}
