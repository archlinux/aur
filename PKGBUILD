# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=python-yummyanime
_name=${pkgname#python-}
pkgver=0.0.8
pkgrel=1
pkgdesc="YummyAnime library"
arch=('any')
url="https://github.com/IM1corp/YummyAPI"
license=('GPL2')
depends=('python' 'python-beautifulsoup4' 'python-aiohttp' 'python-json5')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/f6/f3/b1aa1559d6b580a4a9b9015570345a766497604dd70e35ac9d5a2c29bdc2/yummyanime-0.0.8-py3-none-any.whl")
sha256sums=('937dd28c303e2fa2f32399b33831a90f58da25a24b605e2c74e53738d91d518a')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}




