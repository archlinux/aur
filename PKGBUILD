# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>
# Contributor: Siôn le Roux <sinisterstuf@gmail.com>

pkgname=wakatime
pkgver=13.0.7
pkgrel=1
pkgdesc="Command line interface used by all WakaTime text editor plugins"
arch=('any')
url="https://github.com/wakatime/wakatime"
license=('BSD-3-Clause')
depends=('python')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('07a6d07e1227e3bd45242a2a4861d105bddc6220174a9b739c551bd2d45ce0fd')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
