# Maintainer: Wael Nasreddine <wael.nasreddine@gmail.com>
_name=roca-detect
pkgname=python-${_name}
pkgver=1.2.7
pkgrel=2
pkgdesc="ROCA detection tool"
arch=('any')
url="https://github.com/crocs-muni/roca"
license=('MIT')
depends=('python-cryptography' 'python-six' 'python-future' \
	'python-coloredlogs' 'python-pgpdump' 'python-dateutil')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('e6e1c06b0c2d31724a40bd6c454a003a')

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
