# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=pop-to-8bit
pkgver=0.0.1
pkgrel=1
pkgdesc="Python library for music and audio analysis"
arch=('any')
url="https://github.com/tallero/pop-to-8bit"
license=('GPL2')
depends=('python-librosa' 'pypropack'
         'vamp-pyin-f0-plugin' 'vampy' 'vampy-host')
makedepends=('python-setuptools')
source=("git+$url#branch=setuptools")
md5sums=(SKIP)

package() {
  cd $pkgname
  python3 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
