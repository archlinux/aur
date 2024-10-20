# Maintainer: celenity <celenity@celenity.dev>
pkgname=dove-policies
pkgver=20241019
pkgrel=1
pkgdesc="Standard Dove policies for Mozilla Thunderbird"
arch=(any)
license=('GPL3')
url="https://dove.celenity.dev"
source=("git+https://codeberg.org/celenity/Dove.git#commit=69a6df072f1b0362f08bed356ab1094183d8b340")
sha512sums=('SKIP')

pkgver() {
    echo "$pkgver"
}

package() {
    install -Dm644 "$srcdir/Dove/Policies/Linux/Policies/policies.json" "$pkgdir/usr/lib/firefox/distribution/policies.json"
}