# Maintainer: twa022 <twa022 at gmail dot com>

pkgname='nemo-media-columns'
pkgver=6.2.0
pkgrel=1
pkgdesc="Media properties columns in Nemo"
arch=('any')
license=('GPL2')
url="https://github.com/linuxmint/nemo-extensions"
depends=('nemo-python' 'python-mutagen' 'libgexiv2' 'python-pymediainfo'
         'python-pillow' 'python-pypdf' 'python-stopit')
options=('!emptydirs')
makedepends=('python-setuptools' 'glib2-devel')
source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('b1c7e3d269ed05f472c80c16cf3f12827cbb48cb05406b276be14060225dbbc3')

package() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"

  python setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1
}
