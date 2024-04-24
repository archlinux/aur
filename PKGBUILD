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
source=("https://files.pythonhosted.org/packages/9d/d7/2f5faa1eb203f0b5f1f0f88aced226316639ef9b04294d48be5b896bd851/yummyanime-0.0.7-py3-none-any.whl")
sha256sums=('2bf91a26ad030a181b01cf9ed39f77ef0892a36b111daffd1b90444be75ffb18')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}




