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
source=("https://files.pythonhosted.org/packages/6a/89/48041784ba7ed8f60888e579059c1f79a4d2a1b0ae2946ce6a76a4004874/yummyanime-0.0.8-py3-none-any.whl")
sha256sums=('b5b916d001ed4faba0f107cae1682d2bd50512545ebddbe80c8ab403dd8dfa40')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}




