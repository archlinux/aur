# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>
pkgname='python-speeed'
_name='speeed'
pkgver=1.0.0
pkgrel=1
pkgdesc="Ping like tool that measures packet speed instead of response time"
arch=(any)
url="https://github.com/xengi/speeed"
license=('MIT')
depends=('python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha1sums=('6f8fa71806213df4c1693da4474a085f3900dece')

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}

