# Maintainer: celenity <celenity@celenity.dev>
pkgname=phoenix-policies-no-sync
pkgver=20241022
pkgrel=1
pkgdesc="Standard Phoenix policies for Mozilla Firefox without Firefox Sync"
arch=(any)
license=('GPL3')
url="https://phoenix.celenity.dev"
source=("git+https://codeberg.org/celenity/Phoenix.git#commit=efd0b9f51aff77115e1a3e1285139d66cc4f96f8")
sha512sums=('SKIP')

pkgver() {
    echo "$pkgver"
}

package() {
    install -Dm644 "$srcdir/Phoenix/policies/Linux/No-Sync/policies.json" "$pkgdir/etc/firefox/policies/policies.json"
}