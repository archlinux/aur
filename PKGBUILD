# Maintainer: celenity <celenity@celenity.dev>
pkgname=phoenix-policies
pkgver=20241103
pkgrel=1
pkgdesc="Standard Phoenix policies for Mozilla Firefox"
arch=(any)
license=('GPL3')
url="https://phoenix.celenity.dev"
source=("git+https://codeberg.org/celenity/Phoenix.git#commit=345d8e40b5cce1949443a0edc19a1d98dc23a685")
sha512sums=('SKIP')

pkgver() {
    echo "$pkgver"
}

package() {
    install -Dm644 "$srcdir/Phoenix/policies/Linux/Policies/policies.json" "$pkgdir/etc/firefox/policies/policies.json"
}