# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=python-yummyanime
_name=${pkgname#python-}
pkgver=0.0.7
pkgrel=1
pkgdesc="YummyAnime library"
arch=('any')
url="https://github.com/IM1corp/YummyAPI"
license=('GPL2')
depends=('python' 'python-beautifulsoup4' 'python-aiohttp' 'python-json5')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/c6/0b/e25dafa7215f40252c36d6d8b4d21f0358c1142b1f71722b5afab0342989/yummyanime-0.0.7-py3-none-any.whl")
sha256sums=('068d02c57cac5127a3785075db5e85a40c94da0d7ca9abdcd4bafd5c539f41e7')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}




