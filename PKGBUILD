# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-pluginmgr
pkgver=1.0.0
pkgrel=1
pkgdesc='Lightweight python plugin system supporting config inheritance'
arch=('any')
url="https://github.com/20c/pluginmgr"
license=('Apache')
depends=('python-munge'
         'python-future')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/02/c8/f2ae4ff692e1e2f5fae946b3e8a8f9c8c4a5b3d50292e4df0e7e3fec7355/pluginmgr-1.0.0.tar.gz")
sha256sums=('fa50a48c11b7d36874a1a9877da09e885d2170c6dd1d83d4933ff812c4015d01')

package() {
  cd "pluginmgr-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
