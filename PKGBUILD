# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=formiko
pkgver=1.2.0
pkgrel=2
pkgdesc="reStructuredText editor and live previewer"
url="https://github.com/ondratu/formiko"
license=('BSD')
arch=('any')
depends=('gobject-introspection-runtime' 'gtk3' 'gtksourceview3' 'hicolor-icon-theme' 'python' 'python-docutils' 'python-gobject' 'webkit2gtk')
optdepends=('python-recommonmark: for Common Mark support (MarkDown)')
source=("https://github.com/ondratu/formiko/archive/${pkgver}.tar.gz")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  python setup.py install --root="$pkgdir/" --optimize=1
  
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

md5sums=('94c0f2b24df08831794f1cc591f1632c')
