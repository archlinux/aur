# Maintainer: Sean Enck <enckse@gmail.com>
# Contributor: Peter Crighton <PeteCrighton@gmail.com>
# Maintainer: otaj < jasek.ota at gmail dot com>

pkgname=python-hiyapyco
_name=hiyapyco
pkgver=0.4.16
pkgrel=1
pkgdesc="A Hierarchical Yaml Python Config"
arch=('any')
url="https://github.com/zerwes/hiyapyco"
license=('GPL3')
depends=('python-yaml' 'python-jinja')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/zerwes/hiyapyco/archive/release-$pkgver.tar.gz")
md5sums=('e113c33291a5392b6520f571bcbf6177')

package() {
  cd "$srcdir/hiyapyco-release-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
