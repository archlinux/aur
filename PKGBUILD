# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>
pkgname='python-speeed'
_name='speeed'
pkgver=1.0.1
pkgrel=1
pkgdesc="Ping like tool that measures packet speed instead of response time"
arch=(any)
url="https://github.com/xengi/speeed"
license=('MIT')
depends=('python-setuptools' 'python-docopt' 'python-requests')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha1sums=('b7871d85f4d3c5340e45e27b759acfffcd894e4d')

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}

