_name=collective.checkdocs
pkgname=python-collective-checkdocs
pkgver=0.2
pkgrel=1
pkgdesc='Distutils command to view and validate restructured text in package’s long_description'
arch=(any)
url="https://github.com/collective/$_name"
license=(GPL)
depends=(python python-docutils)
source=("https://pypi.python.org/packages/source/${_name::1}/$_name/$_name-$pkgver.zip")
md5sums=('472a6c7cafad4ee274c905ebd1603fb3')

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
