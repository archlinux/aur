# Maintainer: celenity <celenity@celenity.dev>
pkgname=phoenix-policies-no-sync
pkgver=20240918
pkgrel=1
pkgdesc="Standard Phoenix policies for Mozilla Firefox without Firefox Sync"
arch=(any)
license=('GPL3')
url="https://phoenix.celenity.dev"
source=("git+https://codeberg.org/celenity/Phoenix.git#commit=e35870ed4e9e2c2650a932e0cd928b67bb21c2ad")
sha512sums=('SKIP')

pkgver() {
    echo "$pkgver"
}

package() {
    install -Dm644 "$srcdir/Phoenix/policies/Linux/No-Sync/policies.json" "$pkgdir/usr/lib/firefox/distribution/policies.json"
}