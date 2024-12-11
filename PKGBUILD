# Maintainer: celenity <celenity@celenity.dev>
pkgname=dove-policies
pkgver=20241211
pkgrel=1
pkgdesc="Standard Dove policies for Mozilla Thunderbird"
arch=(any)
license=('GPL3')
url="https://dove.celenity.dev"
source=("git+https://codeberg.org/celenity/Dove.git#commit=b54dda869ccc3b4569e4e4b54b7509778241b79a")
sha512sums=('SKIP')

pkgver() {
    echo "$pkgver"
}

package() {
    install -Dm644 "$srcdir/Dove/policies/Policies/policies.json" "$pkgdir/etc/thunderbird/policies/policies.json"
}