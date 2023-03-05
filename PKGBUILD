# Maintainer: egoroff <egoroff@gmail.com>
pkgname=editorconfiger
pkgver=0.4.1
pkgrel=2
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Plain tool to validate and compare .editorconfig files"
url="https://github.com/aegoroff/editorconfiger"
license=('MIT')

build() {
    return 0
}

package() {
    cargo install --root="$pkgdir" editorconfiger
}
