# Contributor: twa022 <twa022 at gmail dot com>

pkgname=superpaper
pkgver=1.2.0
pkgrel=1
pkgdesc="Cross-platform multi monitor wallpaper manager"
arch=('any')
url="https://github.com/hhannine/Superpaper"
license=('MIT')
depends=('python-pillow' 'python-screeninfo>=0.6.1' 'python-wxpython'
         'python-system_hotkey>=1.0.2+10+9541587' 'python-xpybutil')
makedepends=('python-distutils-extra')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hhannine/${pkgname^}/archive/v${pkgver}.tar.gz")
sha256sums=('501ffac1bf151e6025c39cc6a8181d70ed9ea6a50aff4c55463fc5b9a9daea03')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root "${pkgdir}" --optimize=1
}
