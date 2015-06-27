# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
_tarname='Delorean'
pkgname='python-delorean'
pkgdesc='Library providing a more convenient use of datetimes'
pkgver='0.4.5'
pkgrel='1'
license=('custom:MIT')
arch=('any')
depends=('python-pytz' 'python-dateutil')
source=("https://pypi.python.org/packages/source/D/Delorean/${_tarname}-${pkgver}.tar.gz")
sha512sums=('b40352f0605697ee7d18a95bf6b8f1cd882e18529a4d922aeca0eefa301ef0d191f3636c1b44d8e3e8a19e6dc0fc413a2a35f1d1e063f505a4688fda94369119')

package () {
	cd "${_tarname}-${pkgver}"
	python3 setup.py install --optimize=1 --root="${pkgdir}"
	install -Dm644 LICENSE.txt \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
