# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>
pkgname=python-driftdeck
_name=${pkgname#python-}
pkgver=0.1.2
pkgrel=1
pkgdesc="Drift Deck eats markdown files and spits out beautiful slides directly into your browser."
arch=(any)
url="https://gitlab.com/xengi/driftdeck"
license=('MIT')
depends=('python-setuptools' 'python-docopt' 'python-markdown')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha1sums=('c2fa719bb6eb93c7841932eb1c613863779d9808')

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
