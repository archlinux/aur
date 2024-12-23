# shellcheck shell=bash disable=SC2034,SC2154
pkgname=hyuga
pkgver=1.0.0
pkgrel=1
pkgdesc="yet another hy language server"
arch=(any)
url=https://github.com/sakuraiyuta/$pkgname
depends=(hy hy-hyrule python-pygls python-toolz)
makedepends=(python-installer)
license=(MIT)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('6469dd72b61b2d2b6b379863f66cd4ca3f43a605b942dd951f6db28d7f8164e1')

package() {
	python -minstaller -d"$pkgdir" ./*.whl
}
# ex: nowrap
