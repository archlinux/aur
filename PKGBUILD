# Maintainer: celenity <celenity@celenity.dev>
pkgname=dove-policies
pkgver=20240914
pkgrel=1
pkgdesc="Standard Dove policies for Mozilla Thunderbird"
arch=(any)
license=('GPL3')
url="https://dove.celenity.dev"
source=("git+https://codeberg.org/celenity/Dove.git#commit=beb3168079afc9bb1a203a7b7261714e57d0b875")
sha512sums=('SKIP')

pkgver() {
    echo "$pkgver"
}

package() {
    install -Dm644 "$srcdir/Dove/Policies/Linux/Policies/policies.json" "$pkgdir/usr/lib/firefox/distribution/policies.json"
}