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
source=("https://files.pythonhosted.org/packages/d9/87/012be26c29089cbdda6d43a3ee3dfacb783391e62e805280ed65b952bee5/yummyanime-0.0.7-py3-none-any.whl")
sha256sums=('eff5a41d6dba02685e89bc61debd3aa38f049d26a8f137e0e891da83eef26bf0')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}




