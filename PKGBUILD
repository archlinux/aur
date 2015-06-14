# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>

pkgname=hexchat-autoaway
pkgver=1.0.2
pkgrel=1
pkgdesc="A HexChat plugin to set away on idle"
arch=('i686' 'x86_64')
url="https://github.com/andreyv/hexchat-autoaway"
license=('GPL3')
depends=('hexchat' 'libxss')
conflicts=('hexchat-autoaway-git')
source=("https://github.com/andreyv/hexchat-autoaway/archive/v$pkgver.tar.gz")
sha256sums=('afd78ff8777f162e634d97804787ad8ff9928a3e16d8ef659d0d93b49518b252')

build() {
  cd "${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  install -D autoaway.so "$pkgdir/usr/lib/hexchat/plugins/autoaway.so"
}

# vim:set ts=2 sw=2 et:
