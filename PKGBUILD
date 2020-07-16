# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-pluginmgr
pkgver=0.5.1
pkgrel=1
pkgdesc='Lightweight python plugin system supporting config inheritance'
arch=('any')
url="https://github.com/20c/pluginmgr"
license=('Apache')
depends=('python-munge'
         'python-future')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/20c/pluginmgr/archive/${pkgver}.tar.gz")
sha256sums=('d1cc1a81a81c98960406d7ba9958bd343947407a4c9e82bab77a9da07b006db3')

package() {
  cd "pluginmgr-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}