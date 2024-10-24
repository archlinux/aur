# Maintainer: celenity <celenity@celenity.dev>
pkgname=phoenix-policies
pkgver=20241024
pkgrel=1
pkgdesc="Standard Phoenix policies for Mozilla Firefox"
arch=(any)
license=('GPL3')
url="https://phoenix.celenity.dev"
source=("git+https://codeberg.org/celenity/Phoenix.git#commit=24420cc8faee9782a8fc86e72ecf40c7dd9285f1")
sha512sums=('SKIP')

pkgver() {
    echo "$pkgver"
}

package() {
    install -Dm644 "$srcdir/Phoenix/policies/Linux/Policies/policies.json" "$pkgdir/etc/firefox/policies/policies.json"
}