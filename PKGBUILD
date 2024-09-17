# Maintainer: celenity <celenity@celenity.dev>
pkgname=phoenix-policies
pkgver=20240914
pkgrel=1
pkgdesc="Standard Phoenix policies for Mozilla Firefox"
arch=(any)
license=('GPL3')
url="https://phoenix.celenity.dev"
source=("git+https://codeberg.org/celenity/Phoenix.git#commit=f583ebbe6f43060ce2829236d1a45096011469d4")
sha512sums=('SKIP')

pkgver() {
    echo "$pkgver"
}

package() {
    install -Dm644 "$srcdir/Phoenix/policies/Linux/Policies/policies.json" "$pkgdir/usr/lib/firefox/distribution/policies.json"
}