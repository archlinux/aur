# Maintainer: Fredrik Strandin <fredrik at strandin dot name>
pkgname=emoji-keyboard
pkgver=2.2.0
pkgrel=1
pkgdesc="Virtual keyboard-like emoji picker for linux"
arch=('i686' 'x86_64')
url="https://github.com/OzymandiasTheGreat/emoji-keyboard"
license=('GPL3')
depends=('python' 'python-xlib' 'libappindicator-gtk3')
source=("https://github.com/OzymandiasTheGreat/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('39e4e9edb1d3f75a73f4161289a4586d77a8b4c0c9743437e7239e5976ea157c')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
