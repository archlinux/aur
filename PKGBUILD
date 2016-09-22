_github_name='persistentlist'
pkgname="python-${_github_name}"
pkgver=0.3
pkgrel=1
pkgdesc="Persistentlist is a simple persistent list carrying n objects, the last objects being appended at the end of the list."
url="https://github.com/chaica/persistentlist"
arch=('any')
license=('GPL3')
depends=('python')
makedepends=('python' 'python-setuptools')
source=(
    "https://github.com/chaica/${_github_name}/archive/$pkgver.tar.gz"
)

package() {
  cd "${srcdir}/${_github_name}-${pkgver}"
  python3 setup.py build
  python3 setup.py install --prefix=/usr --root="${pkgdir}"
}

md5sums=('ff16d048246e43a15585e1da08d6b460')
