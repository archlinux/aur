
_project_name='resumable-urlretrieve'
pkgname='python-resumable-urlretrieve'
pkgver=0.1.5
pkgrel=1
pkgdesc="Small library to fetch files over HTTP and resuming their download"
url="https://github.com/berdario/${_project_name}"
arch=('any')
license=('MIT')
depends=('python' 'python-requests')
makedepends=('python' 'python-setuptools')
source=("https://github.com/berdario/${_project_name}/archive/${pkgver}.tar.gz")

package() {
  cd "${srcdir}/${_project_name}-${pkgver}"
  python3 setup.py build
  python3 setup.py install --prefix=/usr --root="${pkgdir}"
}

md5sums=('438bb4c65bbf7ceee025cd1228f4674a')
