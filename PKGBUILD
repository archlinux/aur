# Maintainter: Marc Zuo <zealotzuo@gmail.com>
pkgname=ibus-grc-beta-code-git
pkgver=0.1.r0.ga7c1347
pkgrel=1
pkgdesc="A m17n keymap file for polytonic Greek using beta code"
arch=('any')
url="https://github.com/marczuo/grc-beta-code"
license=('BSD')
depends=('ibus-m17n')
makedepends=('git')
provides=('ibus-grc-beta-code')
conflicts=('ibus-grc-beta-code')
source=('git+https://github.com/marczuo/grc-beta-code')
sha256sums=('SKIP')

pkgver() {
  cd grc-beta-code
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  true
}

package() {
  cd grc-beta-code
  cp -v grc-beta-code.mim /usr/share/m17n/grc-beta-code.mim
}

# vim:set ft=PKGBUILD ts=2 sw=2 et:
