# Submitter: Germán Osella Massa <gosella@gmail.com>

pkgname=('python-mpld3')
pkgver=0.5.7
pkgrel=1
pkgdesc='D3 Viewer for Matplotlib'
arch=('any')
url='http://mpld3.github.io/'
license=('BSD 3-clause')
depends=('python' 'python-matplotlib' 'python-jinja')
makedepends=('python-setuptools')
pypiname='mpld3'
source=("https://pypi.org/packages/source/${pypiname:0:1}/${pypiname}/${pypiname}-${pkgver}.tar.gz")
md5sums=('d84e5c4087c3b288470dc00f4a55598a')

package() {
  cd "$srcdir/mpld3-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
