# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=python-yummyanime
_name=${pkgname#python-}
pkgver=0.0.5
pkgrel=1
pkgdesc="YummyAnime library"
arch=('any')
url="https://github.com/IM1corp/YummyAPI"
license=('GPL2')
depends=('python' 'python-beautifulsoup4' 'python-aiohttp' 'python-json5')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/4a/bf/5c7fb45e3ceb5073322738008368c918a484efa898f4779f56c856a18f5f/yummyanime-0.0.5-py3-none-any.whl")
sha256sums=('84d731c7bc7b61d71ab30da28f7fe6acdf9423cd8bfa4893a398d01123cde412')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}