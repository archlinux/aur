# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=meow-bin
pkgver=1.0
pkgrel=1
pkgdesc="Application Menu Editor for GNOME"
arch=('any')
url="https://pnmougel.github.io/meow/"
license=('GPL')
depends=('java-runtime')
source=("https://github.com/pnmougel/${pkgname%-*}/raw/master/release/${pkgname%-*}_${pkgver}_all.deb")
sha256sums=('daa95e3585346c7b123d429466e9f62800ddf3ec0364b9a451ac0a17aff2d98b')

build() {
  tar xJf "data.tar.xz"
}

package() {
  cp -r usr etc "${pkgdir}"
}