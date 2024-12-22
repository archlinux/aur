# shellcheck shell=bash disable=SC2034,SC2154
pkgname=hyuga
pkgver=0.2.1
pkgrel=1
pkgdesc="yet another hy language server"
arch=(any)
url=https://github.com/sakuraiyuta/$pkgname
depends=(hy hy-hyrule python-pygls python-toolz)
makedepends=(python-installer)
license=(MIT)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('7f203e3080d9a9a1aaa92796a92afaf174a28c26223a8f22e092f80702bb0f67')

package() {
	python -minstaller -d"$pkgdir" ./*.whl
}
# ex: nowrap
