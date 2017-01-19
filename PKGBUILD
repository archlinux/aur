
_project_name='resumable-urlretrieve'
pkgname='python-resumable-urlretrieve'
pkgver=0.1.4
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

md5sums=('c50d74066d5ef801cc76dee1fac4a57f')
