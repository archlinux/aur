# Maintainer: celenity <celenity@celenity.dev>
pkgname=dove-policies
pkgver=20241211
pkgrel=2
pkgdesc="Standard Dove policies for Mozilla Thunderbird"
arch=(any)
license=('GPL3')
url="https://dove.celenity.dev"
source=("git+https://codeberg.org/celenity/Dove.git#commit=b54dda869ccc3b4569e4e4b54b7509778241b79a")
sha512sums=('c5df02608f5012b38c7db5e87e926ecb9a3d42bfdb0b942b1286c843b3b9de4ae84daed6daf4018f46a67027c654fa53971eddf8ba29ba9fb31cbb10b9771fe8')

pkgver() {
    echo "$pkgver"
}

package() {
    install -Dm644 "$srcdir/Dove/policies/Policies/policies.json" "$pkgdir/etc/thunderbird/policies/policies.json"
}