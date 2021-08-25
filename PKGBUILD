# Maintainer: Carson McManus <carson.mcmanus1@gmail.com>
pkgname=steamguard-cli
pkgver=0.4.0
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A command line utility to generate Steam 2FA codes and respond to confirmations."
license=('GPL-3.0-or-later')

build() {
    return 0
}

package() {
    cd $srcdir
    cargo install --root="$pkgdir" --git=https://github.com/dyc3/steamguard-cli
}
