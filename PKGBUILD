# Maintainer: celenity <celenity@celenity.dev>
pkgname=phoenix-policies-no-sync
pkgver=20241211
pkgrel=2
pkgdesc="Standard Phoenix policies for Mozilla Firefox without Firefox Sync"
arch=(any)
license=('GPL3')
url="https://phoenix.celenity.dev"
source=("git+https://codeberg.org/celenity/Phoenix.git#commit=c946044ea477ec93d728fa2c5e9bd6a0021135f3")
sha512sums=('c32d0f344ebe69f871a8b963f8c85634b5d86bda77cadb7304de5f466cc5e233f35b2e6fdb85d56585af7f006b8f954cc884b8b0674fb61a1f0f5d16a512d6d4')

pkgver() {
    echo "$pkgver"
}

package() {
    install -Dm644 "$srcdir/Phoenix/policies/No-Sync/policies.json" "$pkgdir/etc/firefox/policies/policies.json"
}