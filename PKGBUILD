# Maintainer: Mark Huo <markhuomian at gmail dot com>
pkgname=git-repo
pkgver=1.7.4
pkgrel=3
pkgdesc="Tool for managing remote repositories from your git CLI!"
arch=('any')
url="https://github.com/guyzmo/git-repo"
license=('GPL2')
depends=('python' 'python-docopt' 'python-git' 'python-progress' 'python-gitlab'
         'python-uritemplate.py' 'python-github3.py' 'python-bitbucket-api')
makedepends=('python-setuptools' 'python-pip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('c307a53e6d46fd6c1f832500b4eb19011f4f9f07607d09fa3b683b4516654e1a')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="${pkgdir}" --optimize=1
}
