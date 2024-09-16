# Maintainer: celenity <celenity@celenity.dev>
pkgname=dove-policies
pkgver=20240914
pkgrel=1
pkgdesc="Standard Dove policies for Mozilla Thunderbird"
arch=(any)
license=('GPL3')
url="https://dove.celenity.dev"
source=('policies.json')
sha512sums=('0865609a949bb9ce85810e12e8b347ba02dc6c660315058c61c4b5aa2977075503e9fa8013cd1c7ab73831ac73eac2d25fa8d75cd596a23daf96f93a76951c1c')

pkgver() {
    echo "$pkgver"
}

package() {
    install -Dm644 "$srcdir/policies.json" "$pkgdir/usr/lib/thunderbird/distribution/policies.json"
}