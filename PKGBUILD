# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=python-yummyanime
_name=${pkgname#python-}
pkgver=0.0.6
pkgrel=1
pkgdesc="YummyAnime library"
arch=('any')
url="https://github.com/IM1corp/YummyAPI"
license=('GPL2')
depends=('python' 'python-beautifulsoup4' 'python-aiohttp' 'python-json5')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/48/00/9b923ec81830fea6ca5328008d7b33bc69c09b69d7f07567dc2a9b56f0ec/yummyanime-0.0.6-py3-none-any.whl")
sha256sums=('c28edf7c87762300f37ae3d554153547cb0983d5cc33d46885ccbeb1cf07bc39')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}




