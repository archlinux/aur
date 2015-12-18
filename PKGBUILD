
_project_name='resumable-urlretrieve'
pkgname='python-resumable-urlretrieve'
pkgver=0.1.0
pkgrel=2
pkgdesc="Small library to fetch files over HTTP and resuming their download"
url="https://github.com/berdario/${_project_name}"
arch=('any')
license=('MIT')
depends=('python' 'python-requests')
makedepends=('python' 'python-setuptools')
source=("https://pypi.python.org/packages/source/r/${_project_name}/${_project_name}-${pkgver}.tar.gz")

package() {
  cd "${srcdir}/${_project_name}-${pkgver}"
  python3 setup.py build
  python3 setup.py install --prefix=/usr --root="${pkgdir}"
}

md5sums=('0bcd6b56f762712b40edf23370016505')
