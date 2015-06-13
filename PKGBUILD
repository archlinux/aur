pkgname=('python-docker-py')
srcname='docker-py'
pkgver='1.2.2'
pkgrel='1'
pkgdesc='An API client for docker written in Python'
arch=('any')
url='https://github.com/docker/docker-py'
license=('Apache')

depends=('python' 'python-six' 'python-requests')
makedepends=('git' 'python-setuptools')
provides=('python-docker-py')
conflicts=('python-docker-py')

source=("${srcname}::git+https://github.com/docker/docker-py.git#tag=${pkgver}")
sha512sums=('SKIP')

package() {
    cd "${srcdir}/${srcname}"

    python setup.py install --root="${pkgdir}" --optimize=1
}
