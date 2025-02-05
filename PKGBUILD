# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=('python-electrum_aionostr')
_name=electrum_aionostr
name=electrum-aionostr
pkgver=0.0.7
pkgrel=1
pkgdesc=""
arch=('any')
url=""
license=('BSD')
makedepends=('python-pip')
options=(!emptydirs)
source=("https://www.piwheels.org/simple/$name/$_name-$pkgver-py3-none-any.whl")
sha256sums=('cd659a469b63773c2d9daf0468c0c4f7ccfabf7b84f12405406daee33a4e1224')

package() {
  cd "${srcdir}"
  python -m pip install --root="$pkgdir" --no-deps --prefix=/usr --root-user-action=ignore "$name==$pkgver"
}
