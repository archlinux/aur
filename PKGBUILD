# Maintainer: Flaviu Tamas <tamasflaviu@gmail.com>

pkgname=shellpic
pkgver=1.6.2
pkgrel=1
pkgdesc="Shellpic uses escape codes to display images in a terminal, IRC or NUTS client."
arch=("any")
url="https://github.com/larsjsol/shellpic"
license=("GPL3")
depends=("python" "python-pillow")
source=("https://github.com/larsjsol/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0cc9c595d5f2c2c8b6157d4b743695c83b7348c4455c42a8ff8062fb2f2f77cf')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
