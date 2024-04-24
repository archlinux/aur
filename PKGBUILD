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
source=("https://files.pythonhosted.org/packages/d7/65/8ca23960be08b8cacee35a0faa4e9a4edc25f4bc291cdaa4d147c2cfc61c/yummyanime-0.0.7-py3-none-any.whl")
sha256sums=('9ae8a1d756fc4aa33655212a1ab5fc13f37abcc829312136fff3b66abdd49a0e')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}




