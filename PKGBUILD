# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>
pkgname=python-driftdeck
_name=${pkgname#python-}
pkgver=0.3.3
pkgrel=1
pkgdesc="Drift Deck eats markdown files and spits out beautiful slides directly into your browser."
arch=(any)
url="https://gitlab.com/xengi/driftdeck"
license=('MIT')
depends=('python-setuptools' 'python-docopt' 'python-markdown')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha1sums=('cf0c34bc7dad1e32b095ff0ee500c648662a7137')

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
