# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=git-repo
pkgver=1.10.3
pkgrel=1
pkgdesc="Tool for managing remote repositories from your git CLI!"
arch=('any')
url="https://github.com/guyzmo/git-repo"
license=('GPL2')
depends=('python' 'python-docopt' 'python-progress' 'python-dateutil' 'python-lxml' 'python-gitpython' 'python-github3' 'python-gitlab' 'python-gogs-client' 'python-pybitbucket_fork' 'python-attrs')
confilcts=('git-repo-git')
replaces=('git-repo-git')
makedepends=('python-setuptools' 'python-pip')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('a9439f1aad6fc8c83baafcee0913b3b2')

package() {
	cd "$srcdir/$pkgname-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}

