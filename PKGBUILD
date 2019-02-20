# Maintainer: Benjamin Winger <winger.benjamin@gmail.com>

pkgname=openmmm
pkgver=1.0.1
pkgrel=1
pkgdesc="A cli tool to manage mods for OpenMW"
provides=('openmmm')
conflicts=('openmmm')
arch=(any)
url="https://gitlab.com/bmwinger/openMMM"
license=(GPL3)
depends=("python" "patool")
makedepends=("python")
optdepends=("mlox" "omwllf")
source=("https://gitlab.com/bmwinger/openMMM/-/archive/v$pkgver/openMMM-v$pkgver.tar.gz")
sha512sums=('6a9558533041f370fc2fc431039ac8a4064724ade717e404402035c6b747179239243df2d58198a7ed4258b68388d9b7763f69c420a940c72c3f92fff80be7d7')

package() {
  cd "$srcdir/openMMM-v$pkgver"
  python setup.py install --root $pkgdir
}
