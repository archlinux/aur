# Maintainer: twa022 <twa022 at gmail dot com>

pkgname='nemo-media-columns'
pkgver=6.4.0
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
sha256sums=('55e8fb43edde09c3ceba197a4359c1e79b1f0ea7007543d26f32532957aabd49')

package() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"

  python setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1
}
