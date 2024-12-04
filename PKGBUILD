# Maintainer: celenity <celenity@celenity.dev>
pkgname=phoenix-policies
pkgver=20241204
pkgrel=1
pkgdesc="Standard Phoenix policies for Mozilla Firefox"
arch=(any)
license=('GPL3')
url="https://phoenix.celenity.dev"
source=("git+https://codeberg.org/celenity/Phoenix.git#commit=452bf4a974e7ea9431088a1dd3cac489b9c8ba83")
sha512sums=('SKIP')

pkgver() {
    echo "$pkgver"
}

package() {
    install -Dm644 "$srcdir/Phoenix/policies/Linux/Policies/policies.json" "$pkgdir/etc/firefox/policies/policies.json"
}