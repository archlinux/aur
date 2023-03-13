# Maintainer: egoroff <egoroff@gmail.com>
pkgname=editorconfiger
pkgver=0.4.2
pkgrel=1
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Plain tool to validate and compare .editorconfig files"
url="https://github.com/aegoroff/editorconfiger"
license=('MIT')

build() {
    return 0
}

package() {
    cargo install --no-track --bin editorconfiger --features="build-binary" --root "$pkgdir/usr/" editorconfiger
}
