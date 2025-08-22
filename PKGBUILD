# Maintainer: claymorwan <claymorwan@fembois.dev>
pkgname=lncur
_name=${pkgname#python-}
pkgver=1.1.0
pkgrel=1
pkgdesc="Python CLI to update your system packages"
arch=(any)
url="https://pypi.org/project/lncur"
license=('MIT')
makedepends=(python-installer)
provides=($_name)
conflicts=($_name)
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('1505526173b9613d90c8ee4de1dc9043901715935fcec7c917089519bc998bde')

package() {
	cd $srcdir
	python -m installer -d $pkgdir "$_name-$pkgver-py3-none-any.whl"
}
