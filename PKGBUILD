
_project_name='aioftp'
pkgname='python-aioftp'
pkgver=0.6.3
pkgrel=1
pkgdesc="ftp client/server for asyncio"
url="http://pohmelie.github.io/aioftp/"
arch=('any')
license=('WTFPL')
depends=('python')
makedepends=('python' 'python-setuptools')
source=("https://github.com/pohmelie/${_project_name}/archive/${pkgver}.tar.gz")

package() {
  cd "${srcdir}/${_project_name}-${pkgver}"
  python3 setup.py build
  python3 setup.py install --prefix=/usr --root="${pkgdir}"
}

md5sums=('f873e77f82192ab8c80020bb65862fa9')
