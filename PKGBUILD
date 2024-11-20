# Maintainer: celenity <celenity@celenity.dev>
pkgname=dove-policies
pkgver=20241119
pkgrel=1
pkgdesc="Standard Dove policies for Mozilla Thunderbird"
arch=(any)
license=('GPL3')
url="https://dove.celenity.dev"
source=("git+https://codeberg.org/celenity/Dove.git#commit=eaf0c64a275c56a669a0ed244eb07650f3812b7f")
sha512sums=('SKIP')

pkgver() {
    echo "$pkgver"
}

package() {
    install -Dm644 "$srcdir/Dove/Policies/Linux/Policies/policies.json" "$pkgdir/etc/thunderbird/policies/policies.json"
}