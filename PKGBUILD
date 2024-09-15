# Maintainer: celenity <celenity@celenity.dev>
pkgname=phoenix-policies-personal
pkgver=20240914
pkgrel=1
pkgdesc="My personal Phoenix policies for Mozilla Firefox"
arch=(any)
license=('GPL3')
url="https://phoenix.celenity.dev"
source=('policies.json')
sha512sums=('fdea1c340d141a232f0d383caec28e4308bae1ed8452546ebafc8c9292bcb45a9b2a7aa4a938fdd8f58474448fd2206fbf4d3408269381ba35a0fd980e26dddd')

pkgver() {
    echo "$pkgver"
}

package() {
    install -Dm644 "$srcdir/policies.json" "$pkgdir/usr/lib/firefox/distribution/policies.json"
}