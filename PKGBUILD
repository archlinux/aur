# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>
# Contributor: Siôn le Roux <sinisterstuf@gmail.com>

pkgname=wakatime
pkgver=13.0.3
pkgrel=1
pkgdesc="Command line interface used by all WakaTime text editor plugins"
arch=('any')
url="https://github.com/wakatime/wakatime"
license=('BSD-3-Clause')
depends=('python')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2816447bad75d5d77a4105f5bed6bc53add2fa5797273820f29434db36675af4')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
