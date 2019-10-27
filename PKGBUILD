# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>
# Contributor: Siôn le Roux <sinisterstuf@gmail.com>

pkgname=wakatime
pkgver=13.0.1
pkgrel=1
pkgdesc="Command line interface used by all WakaTime text editor plugins"
arch=('any')
url="https://github.com/wakatime/wakatime"
license=('BSD-3-Clause')
depends=('python')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e449da625f7ca5d63be555ed3acb84763873c21217678a2a5bde42b0d2dbb771')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
