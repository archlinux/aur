# Maintainer: celenity <celenity@celenity.dev>
pkgname=phoenix-policies
pkgver=20240914
pkgrel=1
pkgdesc="Standard Phoenix policies for Mozilla Firefox"
arch=(any)
license=('GPL3')
url="https://phoenix.celenity.dev"
source=('policies.json')
sha512sums=('364dfe568397dc9aac0f30d30df2ecc4914ced0f01391b0de798c2f81e723336122740e9e21aefbbbc2c0c8e52310743d1a4638404bad1f52e45edcd2bc3f061')

pkgver() {
    echo "$pkgver"
}

package() {
    install -Dm644 "$srcdir/policies.json" "$pkgdir/usr/lib/firefox/distribution/policies.json"
}