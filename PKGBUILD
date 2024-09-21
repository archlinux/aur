# Maintainer: celenity <celenity@celenity.dev>
pkgname=phoenix-policies-no-sync
pkgver=20240921
pkgrel=1
pkgdesc="Standard Phoenix policies for Mozilla Firefox without Firefox Sync"
arch=(any)
license=('GPL3')
url="https://phoenix.celenity.dev"
source=("git+https://codeberg.org/celenity/Phoenix.git#commit=96c46af0e07aac2e35f70bf5cb4d33dfb2cc770c")
sha512sums=('SKIP')

pkgver() {
    echo "$pkgver"
}

package() {
    install -Dm644 "$srcdir/Phoenix/policies/Linux/No-Sync/policies.json" "$pkgdir/usr/lib/firefox/distribution/policies.json"
}