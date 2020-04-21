# Contributor: twa022 <twa022 at gmail dot com>

pkgname=superpaper
pkgver=2.0.0
pkgrel=1
pkgdesc="Cross-platform multi monitor wallpaper manager"
arch=('any')
url="https://github.com/hhannine/Superpaper"
license=('MIT')
depends=('python-pillow' 'python-screeninfo>=0.6.1' 'python-wxpython'
         'python-system_hotkey>=1.0.2+10+9541587' 'python-xpybutil' 'python-numpy')
makedepends=('python-distutils-extra')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hhannine/${pkgname^}/archive/v${pkgver}.tar.gz")
sha256sums=('f1ffbc7cdeb77474c4dfaa6ec7db66d797aa750af164f9e343860ea9ea0dbbe5')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root "${pkgdir}" --optimize=1
}
