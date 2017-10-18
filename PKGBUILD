# Maintainer: Wael Nasreddine <wael.nasreddine@gmail.com>
_pkgname=roca-detect
pkgname=python-${_pkgname}
pkgver=1.0.7
pkgrel=1
pkgdesc="ROCA detection tool"
arch=('any')
url="https://github.com/crocs-muni/roca"
license=('MIT')
depends=('python-cryptography' 'python-six' 'python-future' \
	'python-coloredlogs' 'python-pgpdump' 'python-dateutil')
source=("https://pypi.python.org/packages/48/37/da3db919e79844180e175d2608c5ab195753c4c92405d4a650ba42a1231b/$_pkgname-$pkgver.tar.gz")
md5sums=('1c85571a20cd606328a5beaa95c5fc25')

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
