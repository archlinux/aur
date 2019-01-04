# Maintainer: Benjamin Winger <winger.benjamin@gmail.com>

pkgname=openmmm
pkgver=1.0
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
sha512sums=('1d5f88f5679f68c67773b62915a78ad9e05105094aaa9b331a982b19e2fb29c42f371d07ae13855f470b8cb2a6d9e3a17dfed4a90c03db89dc18e9f3ed1cae66')

package() {
  cd "$srcdir/openMMM-v$pkgver"
  python setup.py install --root $pkgdir
}
