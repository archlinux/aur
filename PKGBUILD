# Maintainer: celenity <celenity@celenity.dev>
pkgname=phoenix-policies-no-sync
pkgver=20240925
pkgrel=1
pkgdesc="Standard Phoenix policies for Mozilla Firefox without Firefox Sync"
arch=(any)
license=('GPL3')
url="https://phoenix.celenity.dev"
source=("git+https://codeberg.org/celenity/Phoenix.git#commit=237ac032b5d529ddc99e56883488596256cb800e")
sha512sums=('SKIP')

pkgver() {
    echo "$pkgver"
}

package() {
    install -Dm644 "$srcdir/Phoenix/policies/Linux/No-Sync/policies.json" "$pkgdir/usr/lib/firefox/distribution/policies.json"
}