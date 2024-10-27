# Maintainer: celenity <celenity@celenity.dev>
pkgname=phoenix-policies
pkgver=20241027
pkgrel=1
pkgdesc="Standard Phoenix policies for Mozilla Firefox"
arch=(any)
license=('GPL3')
url="https://phoenix.celenity.dev"
source=("git+https://codeberg.org/celenity/Phoenix.git#commit=b26429e617d58831a4071a4ed7b281129e2e49ec")
sha512sums=('SKIP')

pkgver() {
    echo "$pkgver"
}

package() {
    install -Dm644 "$srcdir/Phoenix/policies/Linux/Policies/policies.json" "$pkgdir/etc/firefox/policies/policies.json"
}