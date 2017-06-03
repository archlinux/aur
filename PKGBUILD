# Maintainer: Fredrik Strandin <fredrik at strandin dot name>
pkgname=emoji-keyboard
pkgver=2.1.0
pkgrel=1
pkgdesc="Virtual keyboard-like emoji picker for linux"
arch=('i686' 'x86_64')
url="https://github.com/OzymandiasTheGreat/emoji-keyboard"
license=('GPL3')
depends=('python' 'python-xlib' 'libappindicator-gtk3')
source=("https://github.com/OzymandiasTheGreat/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('2d366a6cb2557e1c8c2b5a4de600cd2553306a5ece2540c20dc5049a5cff1a44')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
